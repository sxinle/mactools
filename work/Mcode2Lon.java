import java.util.*;
import java.util.regex.Pattern;
public class Mcode2Lon {

    static final int NORTHEST_LATITUDE = 0x1D77B500;
    static final int SOUTHEST_LATITUDE = 0x028CE76B;
    static final int EASTEST_LONGITUDE = 0x4A420206;
    static final int WESTEST_LONGITUDE = 0x28605F68;

    static long[] lonLat = new long[2];
    static String keywords;

    public static void main(String[] args) {

        String argv = "";
        for (int i = 0; i < args.length; i++) {
            argv += args[i];
        }
        boolean hasCoords = Pattern.compile("[A-Z0-9-]{9,11}").matcher(argv).find();

        if (args.length == 1 || !hasCoords) {
            keywords = args[0];
            setCoords();
        } else {
            lonLat = convertMcodeToGeo(args[0].replaceAll("-", ""));
            keywords = args[1];
        }

        // System.out.println("lon\t" + lonLat[0] + "\n" + "lat\t" + lonLat[1]);

        String param = "param=" + "\n" +
                "{" + "\n" +
                "    \"product_id\": \"mx\"," + "\n" +
                "    \"keywords\": \"" + keywords + "\"," + "\n" +
                "    \"country\": \"CHN\"," + "\n" +
                "    \"language\": \"zh\"," + "\n" +
                "    \"offset\": 0," + "\n" +
                "    \"limit\": 200," + "\n" +
                "    \"pos_lon\": \"" + lonLat[0] + "\"," + "\n" +
                "    \"pos_lat\": \"" + lonLat[1] + "\"," + "\n" +
                "    \"need_substitute\": \"false\"," + "\n" +
                "    \"source\": \"mx\"" + "\n" +
                "}";

        System.out.println(param);
    }

    static void setCoords() {
        Map<String, String> map = new HashMap<>();
        map.put("沈阳", "1137956355,385338756");
        map.put("大连", "1120768960,358644160");
        map.put("广州", "1043763222,213273805");
        map.put("兰州", "957012203,332385251");
        map.put("深圳", "1051251830,207871091");
        map.put("初始位置", "1049731520,207914560");

        List<String> keys = new ArrayList<>();
        Set<String> k = map.keySet();
        keys.addAll(k);

        Scanner s = new Scanner(System.in);
        String line = s.nextLine();

        String[] coords = map.get(keys.get(Integer.parseInt(line))).split(",");
        lonLat[0] = Long.parseLong(coords[0]);
        lonLat[1] = Long.parseLong(coords[1]);
    }

    static byte convertMcodeCharToBit32(char t) {
        if (t >= '2' && t <= '9')        //范围~9对应~7
        {
            return (byte) (t - '2');
        }
        if (t >= 'A' && t <= 'H')    //范围A~H对应~15
        {
            return (byte) (t - 'A' + 8);
        }
        if (t >= 'J' && t <= 'N')        //范围J~N对应~20
        {
            return (byte) (t - 'J' + 16);
        }
        if (t >= 'P' && t <= 'Z')        //范围P~Z对应~31
        {
            return (byte) (t - 'P' + 21);
        }
        return (byte) 0xff;
    }

    static long[] convertMcodeToGeo(String pcMcode) {
        long lLatitude_1_8, lat;
        long lLongitude_1_8, lon;
        if ((convertMcodeCharToBit32(pcMcode.charAt(0)) & 0x3) != 0) {
            return null;
        }
        //得到相对纬度/8s
        lLatitude_1_8 = (convertMcodeCharToBit32(pcMcode.charAt(0)) >> 4) * 32 * 32 * 32 * 32
                + (convertMcodeCharToBit32(pcMcode.charAt(5))) * 32 * 32 * 32
                + (convertMcodeCharToBit32(pcMcode.charAt(6))) * 32 * 32
                + (convertMcodeCharToBit32(pcMcode.charAt(7))) * 32
                + (convertMcodeCharToBit32(pcMcode.charAt(8)));
        //得到绝对纬度/8s
        lLatitude_1_8 += SOUTHEST_LATITUDE / 320;
        //得到绝对纬度/2560s
        lat = lLatitude_1_8 * 320;
        //得到相对经度/8s
        lLongitude_1_8 = ((convertMcodeCharToBit32(pcMcode.charAt(0)) >> 2) & 0x3) * 32 * 32 * 32 * 32
                + (convertMcodeCharToBit32(pcMcode.charAt(1))) * 32 * 32 * 32
                + (convertMcodeCharToBit32(pcMcode.charAt(2))) * 32 * 32
                + (convertMcodeCharToBit32(pcMcode.charAt(3))) * 32
                + (convertMcodeCharToBit32(pcMcode.charAt(4)));
        //得到绝对经度/8s
        lLongitude_1_8 += WESTEST_LONGITUDE / 320;
        //得到绝对经度/2560s
        lon = lLongitude_1_8 * 320;
        return new long[]{lon, lat};
    }

}
