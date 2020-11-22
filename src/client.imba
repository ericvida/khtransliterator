# https://medium.com/digital-linguistics/transliteration-in-javascript-99d306996752
import {transliterate as tr} from '@digitallinguistics/transliterate'
import {dictionary} from './dictionary'

tag App
	# prop text = "កៀ គ្នា"
	prop text = "ព្រះ‌ជាម្ចាស់​ស្រឡាញ់​មនុស្ស​លោក​ខ្លាំង​ណាស់ ហេតុ​នេះ​ហើយ​បាន​ជា​ព្រះអង្គ​ប្រទាន​ព្រះ‌បុត្រា​តែ​មួយ​របស់​ព្រះអង្គ​មក ដើម្បី​ឲ្យ​អស់​អ្នក​ដែល​ជឿ​លើ​ព្រះ‌បុត្រា មាន​ជីវិត​អស់‌កល្ប​ជានិច្ច គឺ​មិន​ឲ្យ​គេ​វិនាស​ឡើយ។"
	css header
		ta:center
		input
			ta: center
	css main
		p:4
		ta:center

	def render
		<self>
			<header[p:4 bg:gray1]>
				<input[p:1em bg:gray2 rd:2 fs:2xl] bind=text placeholder="paste khmer to transliterate">
			<main[display: flex]>
				<section[px:1em]>
					<h5> "khmer"
					<p> text	
				<section[px:1em]>			
					<h5> "transliteration"
					<p> tr(text, dictionary)
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