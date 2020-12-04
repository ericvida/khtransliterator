# Tool to see unicode of khmer script: https://qaz.wtf/u/show.cgi
import './styles'
import {transliterate as tr} from './transliterate'
import {syl} from './syllables'


# ====================================
# MENU > APP
# ====================================
tag Menu
	css &
		d:flex
		jc:center
		py:4em
	css $inputbox, $outputbox
		pos:relative
	css $inputbox
		mr:2em
	css .title
		bg:yellow5
		px:5px py:2px	ff:monospace
		mt:-10px
		d:block
		rdt:sm
		w:100%
		ta:center
	css $input
		bd:2px solid gray4	px:3	rd:2 rdt:0	py:3	c:gray9	fs:lg d:inline-block
		bdt:none
		bg:gray1
		max-width:150px
		w:100%
		ta:center
	css $button
		p:1	rd:2	mx:1	fw:bold	bg:gray5	c:white
		@hover
			b:5px
			bg:purple5
		@active
			bg:purple6
		&.current
			bg:purple5
	def toggle str
		if str is "vida"
			vida = true
		else
			vida = false
		console.log vida
	def render
		<self>
			<form$inputbox>
				<label.title> "Paste Khmer 🇰🇭"
				<input$input placeholder="paste khmer to transliterate" bind=input>
			<$outputbox>
				<label.title>
					if vida
						"Choose Output 🇺🇸"
					else
						"Choose Output 🇰🇭"
				<$input>
					<button$button .current=vida type="button" alt="Vida alphabet" @click.toggle("vida")> "Vida"
					<button$button .current=!vida type="button" alt="Spaced Khmer" @click.toggle("spaced")> "Spaced"


# ====================================
# CALLOUT, CALLOUT PURPLE > OUTPUT CARD
# ====================================
tag Callout
	css &	
		d:block	p:1em	rd:1	my:20px
		max-width: 700px mx:auto
		c:gray9
		lh: 130%
	def render
		<self>
			<slot>


# ====================================
# OUTPUT CARD > APP
# ====================================
tag OutputCard
	css $outbox	
		min-height:150px mb:30px	c:purple9 	px:5 pt:2 pb:4	rd:2 	fs:8
		max-width: 800px mx:auto bxs:md, xxl
		bg: white
		span.title
			c:purple8/30 ff:monospace	fs:1em ta:left d:block 
			m:0 p:0
		p.transliteration
			ff: monospace
			my:0
	def render
		<self>
			if !vida
				<div$outbox>
					<span.title> "Output: Khmer Spaced"
					<p.transliteration> input.replaceAll('\u200B', "\u0020").replaceAll('\u200C', "_")
			else
				<div$outbox>
					<span.title> "Output: Vida"
					<p.transliteration> tr(input.replaceAll('\u200B', "\u0020").replaceAll('\u200C', "_"), syl)
				<Callout>
					<h3[c:purple6]> "Info about the Vida Phonetic System"
					<ul>
						<li> "A dot below a consonant [p̣,ḷ] indicates a second group consonant"
						<li> "A line below a consonant [ḇ, ṟ̣ , y̱̣] indicates that it is a subscript in the original khmer."
						<li> "A dot above a vowel [u̇] indicates that the vowel is pronounced more open."
						<li> "A dot below a vowel [ụ] indicates that it is pronounced more closed."
						<li> "A hyphen between words [-] indicates that it is a composite word."
						<li> "If vowels are missing, the conconant takes it's natural voicing."
						<ul>
							<li> "first group consonsants [k] (no dot) are voiced [kȯ], sounding as the 'u' in 'umbrella'. [kȯ]"
							<li> "second group consonsants [ḳ] (dot below) are voiced as [ḳo]  as the first 'o' in 'oreo'. [ḳo]"
						<li> "Subscript consonants [ḇ] are often silent when found after another consonant on the last syllable of a word. [ȯh_kḷḇ] is pronounced [ȯh_kȯḷ]"

# ====================================
# FOOTER > APP
# ====================================
tag Footer < footer
	css &
		py:1em
		ta:center
		c:gray5
		ff:sans
		pos: fixed
		b: 0
		w:100%
		bg:gray9
		a@active,a@visited
			c:gray6
		a@hover
			c:orange4
	def render
		<self> "created by {<a href="https://github.com/ericvida/" target="_blank"> "Eric Vida"}"


# ====================================
# APP
# ====================================
tag App
	prop input = "ព្រះ‌ជាម្ចាស់​ស្រឡាញ់​មនុស្ស​លោក​ខ្លាំង​ណាស់ ហេតុ​នេះ​ហើយ​បាន​ជា​ព្រះអង្គ​ប្រទាន​ព្រះ‌បុត្រា​តែ​មួយ​របស់​ព្រះអង្គ​មក ដើម្បី​ឲ្យ​អស់​អ្នក​ដែល​ជឿ​លើ​ព្រះ‌បុត្រា មាន​ជីវិត​អស់‌កល្ប​ជានិច្ច គឺ​មិន​ឲ្យ​គេ​វិនាស​ឡើយ។
	យ៉ូហាន ៣៖១៦ "
	prop vida = true
	css &
		d:block
		bg:gray1
		min-height:95vh
	css header 
		ta:center fw:bold 
		m:0 py:3em px:6 
		bg:purple6 rdbl:30px 30px
		h3 fw:lighter ff: monospace c:white fs:3em m:0
		h6 c:yellow5 m:0
		
	css #wrapper
		bg:purple6
		main
			rdtr:30px 30px p:0 
			bg:gray1
			min-height: 600px
			px:10
	def render
		<self>
			<header>
				<h3> "Ȯks̱ȯȯ Ṿidaa"
				<h6> "Convert Khmer to the Vida Writing System"
			<#wrapper>
				<main>
					<Menu bind:input=input bind:vida=vida>
					<OutputCard bind:input=input bind:vida=vida>
			<Footer>


# ====================================
# MOUNT APP
# ====================================

imba.mount <App>