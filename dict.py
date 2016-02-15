#! /usr/bin/python
# -*- coding: UTF-8 -*-
import re;
import urllib;
import urllib2;
import json
import sys;
def debug():
	xml = open("word.xml").read();
	print get_text(xml);
	print get_elements_by_path(xml, "custom-translation/content");
	#print_translations(xml, False, False);
def get_elements_by_path(xml, elem):
	if type(xml) == type(''):
		xml = [xml];
	if type(elem) == type(''):
		elem = elem.split('/');
	if (len(xml) == 0):
		return [];
	elif (len(elem) == 0):
		return xml;
	elif (len(elem) == 1):
		result = [];
		for item in xml:
			result += get_elements(item, elem[0]);
		return result;
	else:
		subitems = [];
		for item in xml:
			subitems += get_elements(item, elem[0]);
		return get_elements_by_path(subitems, elem[1:]);
textre = re.compile("\!\[CDATA\[(.*?)\]\]", re.DOTALL);
def get_text(xml):
	match = re.search(textre, xml);
	if not match:
		return xml;
	return match.group(1);
def get_elements(xml, elem):
	p = re.compile("<" + elem + ">" + "(.*?)</" + elem + ">", re.DOTALL);
	it = p.finditer(xml);
	result = [];
	for m in it:
		result.append(m.group(1));
	return result;
#GREEN = "\033[1;32m";
GREEN = "\033[4m"
DEFAULT = "\033[0;49m";
BOLD = "\033[1m";
UNDERLINE = "\033[4m";
NORMAL = "\033[m";
RED = "\033[1;31m"
def crawl_xml(queryword):
	return urllib2.urlopen("http://dict.yodao.com/search?keyfrom=dict.python&q="
        + urllib.quote_plus(queryword) + "&xmlDetail=true&doctype=xml").read();
def print_translations(xml, with_color, detailed):
	#print xml;
	original_query = get_elements(xml, "original-query");

	phonetic = get_elements(xml, "phonetic-symbol");
	#print "[" + phonetic[0].decode('utf8').encode('utf8') + "]";
	#return;

	queryword = get_text(original_query[0]);
	custom_translations = get_elements(xml, "custom-translation");

	if len(phonetic) > 0:
		print RED + BOLD + UNDERLINE + queryword + " [" + phonetic[0].decode('utf8').encode('utf8') + "]" + NORMAL;
	else:
		print RED + BOLD + UNDERLINE + queryword + " [no query results]" + NORMAL;


	translated = False;

	for cus in custom_translations:
		source = get_elements_by_path(cus, "source/name");
		print RED + "==========================================[" + source[0] + "]==========================================";# + DEFAULT;
		contents = get_elements_by_path(cus, "translation/content");
		if with_color:
			for content in contents[0:5]:
				print RED + get_text(content);# + DEFAULT;
		else:
			for content in contents[0:5]:
				print RED + get_text(content);
		translated = True;

	yodao_translations = get_elements(xml, "yodao-web-dict");
	printed = False;
	for trans in yodao_translations:
                webtrans = get_elements(trans, "web-translation");
		for web in webtrans[0:5]:
			if not printed:
				print RED + "============================================[YODAO]===========================================";# + DEFAULT;
				printed = True;
	        	keys = get_elements(web, "key");
			values = get_elements_by_path(web, "trans/value");
			summaries = get_elements_by_path(web, "trans/summary");
			key = keys[0].strip();
			value = values[0].strip();
			#summary = summaries[0].strip();
                        #lines = get_elements(summary, "line");
		        if with_color:
			       	print RED +  get_text(key) + ":\t" + RED + get_text(value) + NORMAL;
					   #print BOLD +  get_text(key) + ":\t" +DEFAULT + GREEN + get_text(value) + NORMAL;
                                #for line in lines:
                                #        print GREEN + get_text(line) + DEFAULT;
				#print get_text(summary) + DEFAULT;
		        else:
			       	print RED +  get_text(key) + ":\t" + RED + get_text(value) + NORMAL;
				# print get_text(value);
				#print get_text(summary);
		        #translated = True;
		        #if not detailed:
			#        break

def usage():
	print "usage: dict.py word_to_translate";

def baiduTranslate(words):
	# d ={"query":words.decode("utf8").encode("gbk")};
	# words = urllib.urlencode(d,"gbk");
	words = words.replace('*', '')
	url = 'http://fanyi.baidu.com/v2transapi'
	values = {'from':'en','to':'zh','query': words,'transtype':'trans','simple_means_flag':'3'}
	data = urllib.urlencode(values)
	req_header = {'User-Agent':'AppleWebKit/537.11 (KHTML, like Gecko)',
				  'Accept':'text/html;q=0.9,*/*;q=0.8',
				  'Accept-Charset':'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
				  'Connection':'close',
				  'Referer':None #注意如果依然不能抓取的话，这里可以设置抓取网站的host
				}
	req_timeout = 5
	req = urllib2.Request(url,data,req_header)
	resp = urllib2.urlopen(req,data,req_timeout)
	html = resp.read()
        # print html
	return html

def main(argv):
	if len(argv) <= 0:
		usage();
		#debug();
		sys.exit(1);
	if len(argv) > 5: #argv是个数组
		inputWord = ''; inputTmp = ''
		i = 0
		for arg in argv:#10个单词一行
			inputTmp = inputTmp + arg + ' ';i = i + 1
			if i % 10 == 0:
				inputWord = inputWord + inputTmp + '\n'
				i = 0
				inputTmp = ''
		if '' != inputTmp:
			inputWord = inputWord + inputTmp + '\n'
		# print inputWord

		print BOLD + RED + '===百度翻译==='
		result = baiduTranslate(inputWord)
		jsonRet = json.loads(result)
		rets = jsonRet['trans_result']['data']
		for ret in rets:
			print RED + ret['src']
			print RED + ret['dst'].encode('utf8')
			# print ret[1].encode('utf8')
	else:
		xml = crawl_xml(" ".join(argv));
		print_translations(xml, True, False);

if __name__ == "__main__":
	main(sys.argv[1:]);

