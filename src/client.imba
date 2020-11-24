# https://medium.com/digital-linguistics/transliteration-in-javascript-99d306996752
import './styles'
import {transliterate as tr} from './transliterate'
import {syl} from './syllables'

tag App
	prop text = "ព្រះ‌ជាម្ចាស់​ស្រឡាញ់​មនុស្ស​លោក​ខ្លាំង​ណាស់ ហេតុ​នេះ​ហើយ​បាន​ជា​ព្រះអង្គ​ប្រទាន​ព្រះ‌បុត្រា​តែ​មួយ​របស់​ព្រះអង្គ​មក ដើម្បី​ឲ្យ​អស់​អ្នក​ដែល​ជឿ​លើ​ព្រះ‌បុត្រា មាន​ជីវិត​អស់‌កល្ប​ជានិច្ច គឺ​មិន​ឲ្យ​គេ​វិនាស​ឡើយ។ - យ៉ូហាន ៣៖១៦"
	css &
		bg:gray9
		d:block
		min-height:100vh
		header
			ta:center
			m:0
			pt:7 
			pb:5 
			ta:center 
			ff:sans 
			fw:bold 
			h3
				c:orange6
				fs:3em
				ff:script
				m:0
			h6
				c:orange4
				m:0
			input
				ta: center
		main
			d:flex
			fld:column
			max-width: 800px
			d:block
			mx:auto
			section
				d:block
			div, textarea
				mb:20px
				bxs:lg 
				bg:white 
				c:teal9 
				p:4
				rd:2 
				fs:8 
				ff:mono 
				min-width:100%
				min-height: 150px
			span
				c:orange4
				ff:sans
				fw:bold
				fs:1em
				mb:8px
				d:block
	def render
		<self>
			<header>
				<h3> "Ȯks̱aaṾida"
				<h6> "Khmer to Vida Writing System transliterator"
			<main>
				<section>
					<span> "Paste/Type Khmer Here"
					<textarea bind=text placeholder="paste khmer to transliterate">
				<section>			
					<span> "Vida System"
					<div>
						tr(text.replaceAll('\u200B', "\u0020").replaceAll('\u200C', "—"), syl)
				<section>			
					<span> "Khmer Spaced"
					<div>
						text.replaceAll('\u200B', "\u0020").replaceAll('\u200C', "—")
			<footer[ta:center ff:sans fs:.6em c: gray9]>
				<p> "Created by Eric Vida"
imba.mount <App>