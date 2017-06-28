import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

public class Translator {
    static Map<String, String> map = new HashMap<>();

    public static void main(String[] args) {
        String word = args[0];
        // skirmish	英 ['skɜːmɪʃ]&&美 ['skɝmɪʃ]_n. 小冲突，小规模战斗；小争论&&vi. 进行小规模战斗；发生小争论
        String trans = map.get(word);

        if (null == trans) {
            System.out.println("no query result...");
        } else {
            String[] t = trans.split("_");
            if (t.length != 2) {
                System.out.println(trans);
            } else {
                String tone = t[0];
                String ts = t[1];
                System.out.println(word + "\t" + tone.replaceAll("&&", "\t"));
                System.out.println("--------------------------------------");
                System.out.print("\t\t");
                System.out.println(ts.replaceAll("&&", "\n\t\t"));
            }
        }
    }


    static {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(Translator.class.getResourceAsStream("trans.hash_sort")));
            String line;
            while ((line = br.readLine()) != null) {
                String[] arr = line.split("\t");
                String k = arr[0];
                String v = arr[1];
                map.put(k, v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
