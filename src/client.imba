# https://medium.com/digital-linguistics/transliteration-in-javascript-99d306996752
import './styles'
import {transliterate as tr} from './transliterate'
import {dictionary} from './dictionary'
import {khsv} from './khsvwordlist'


tag App
	# prop text = "កៀ គ្នា"
	prop text = "ព្រះ‌ជាម្ចាស់​ស្រឡាញ់​មនុស្ស​លោក​ខ្លាំង​ណាស់ ហេតុ​នេះ​ហើយ​បាន​ជា​ព្រះអង្គ​ប្រទាន​ព្រះ‌បុត្រា​តែ​មួយ​របស់​ព្រះអង្គ​មក ដើម្បី​ឲ្យ​អស់​អ្នក​ដែល​ជឿ​លើ​ព្រះ‌បុត្រា មាន​ជីវិត​អស់‌កល្ប​ជានិច្ច គឺ​មិន​ឲ្យ​គេ​វិនាស​ឡើយ។"
	css header
		ta:center
		input
			ta: center
	css main
		p:4
		d:flex
		fld:column
	css section
		d:block
	def copy text
		console.log $output
		document.execCommand("Copy")
	css &
		bg:gray3
		d:block
		min-height:100vh
	def render
		<self>
			<header[pt:7 pb:5 ta:center ff:sans fw:bold c:gray9]> "Khmer Transliteration to Vida Phonetic System"
			<main[d:flex]>
				<section[ff:sans]>
					<span[c:teal9 fw:bold bg:teal5 w:auto p:2 rd:1 pos:absolute mt:-10px ml:10px fs:.7em]> "Paste Khmer Input here"
					<textarea[pt:2em px:1em bg:white rd:2 fs:1xl w:100% min-height:90px] bind=text placeholder="paste khmer to transliterate">

				<section[ff:sans pt:6]>			
					<span[c:teal9 fw:bold bg:teal5 w:auto p:2 rd:1 pos:absolute mt:-10px ml:10px fs:.7em]> "Output"
					<p[bg:gray9 c:white p:4 rd:2 fs:3 ff:mono]> 
						tr(text, dictionary)
				# <section>
				# 	<ol>
				# 		for item in khsv
				# 			<li> "{item[0]} - {tr(item[0], dictionary)} - {item[1]}"
						
			<footer[ta:center ff:sans fs:.6em c: gray9]>
				<p> "Created by Eric Vida"
			# # WORKS mostly well
			# for letter in text
			# 	if group is 1 and !cons.includes(letter)
			# 		<span> tr(letter, vow1)
			# 	elif group is 2 and !cons.includes(letter)
			# 		# <span> tr(text, extra)
			# 		<span> tr(letter, vow2)
			# 	elif cons1.includes(letter)
			# 		<span> tr(letter, con)
			# 		group = 1
			# 	elif cons2.includes(letter)
			# 		<span> tr(letter, con)
			# 		group = 2
			# 	elif !alphabet.includes(letter)
			# 		<span> tr(letter, extra)
imba.mount <App>