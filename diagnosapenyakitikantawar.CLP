
;;;************************************************************************************************************
;;;* mengidentifikasi kondisi penyakit ikan air tawar ( Studi Kasus keramba Rawa Jejed -klapanunggal) selesai *
;;;************************************************************************************************************

(defrule withFish
	=>
	(printout t crlf "apakah ikan di dalam keramba anda mengalami penyakit?" crlf "0 : no" crlf "1 : yes" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (assert (withFish yes)) 
	) (if (= ?x 0)
		then (assert (withFish no))
	)
)

; rule awal dijawab yes, membahas penyakit jamur pada ikan , selesai
(defrule askeddiseasefungal (withFish yes)
	=>
	(printout t crlf "apakah ikan di keramba anda mengalami ditumbuhinya 
	sekumpulan benang halus seperti kapas?" crlf "0 : no" crlf "1 : yes" crlf)
	(bind ?x (read))
	(if (= ?x 1)
	then (printout t crlf "Maka ikan mengalami penyakit jamur,
	Solusinya pisahkan ikan yang terkena jamur pada kolam karangtina lalu memberikan garam pada air kolam" crlf)
	) 
	(if (= ?x 0)
		then (assert (askeddiseasefungal no))
	)
)

; ask membahas penyakit infeksi pada ikan, selesai
(defrule askeddiseaseinfection (askeddiseasefungal no)
	=>
	(printout t crlf "apakah ikan di keramba anda mengalami nafsu makan turun?" crlf "0 : no" crlf"1 : yes" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (assert (askeddiseaseinfection yes))
	)
	(if (= ?x 0) ; berada di bawah rule utama. selesai
		then (assert (askeddiseaseinfection no))
	)
)

; ask membahas penyakit infeksi herpes pada ikan ,
(defrule askedtwodisease (askeddiseaseinfection yes)
	=>
	(printout t crlf "apakah ikan di keramba anda mengalami?" crlf "0 : no" crlf "1 : Lemah" crlf "2 : Luka dipermukaan"  crlf)
	(bind ?x (read))
	(if (= ?x 2)
	then (printout t crlf "Maka ikan mengalami penyakit Herpes,
	Solusinya pisahkan ikan yang terkena Herpes pada kolam karangtina lalu memberikan antibiotik pada air kolam
	lalu jaga suhu kolan agar tetap hangat" crlf)
	)
	(if (= ?x 1)
	then (printout t crlf "Maka ikan mengalami penyakit infeksi,
	Solusinya pisahkan ikan yang terkena infeksi pada kolam karangtina lalu memberikan antibiotik pada air kolam" crlf)
	)
	(if (= ?x 0)
		then (assert (askedtwodisease no))
	)
)

(defrule askedredmountdiasease (askedtwodisease no)
	=>
	(printout t crlf "apakah ikan di keramba anda mengalami mulut merah?" crlf "0 : no" crlf"1 : yes" crlf)
	(bind ?x (read))
	(if (= ?x 1)
	then (printout t crlf "Maka ikan mengalami penyakit Mulut merah,
	Solusinya ikan yang terkena penyakit mulut merah, memberikan antibiotik pada area mulut yang merah" crlf)
	)
	(if (= ?x 0)
	then (assert (askedredmountdiasease no))
	)
)

(defrule askedgillparasitediasease (askedredmountdiasease no)
	=>
	(printout t crlf "apakah ikan di keramba anda mengalami lendir yang berlebihan pada insang?" crlf "0 : no" crlf"1 : yes" crlf)
	(bind ?x (read))
	(if (= ?x 1)
	then (printout t crlf "Maka ikan mengalami penyakit parasite pada insang,
	Solusinya pisahkan ikan yang terkena parasite pada insang pada kolam karangtina lalu memberikan garam dan antibiotik pada air kolam" crlf)
	)
	(if (= ?x 0)
		then (assert (askedgillparasitediasease no))
	)
)


; rule awal dijawab no , selesai
(defrule maintain1 (withFish no)
 	=>
	(printout t crlf "apakah anda selalu  merawat keramba ikan setiap harinya?" crlf "0 : no" crlf "1 : yes" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Tetap selalu merawat keramba ikan dengan baik :)" crlf)
	) (if (= ?x 0)
		then (printout t crlf "apakah di sekitar keramba ikan anda, banyak ikan kecil, udang, atau sejenis pelankton
		yang dapat dimakan oleh ikan?" crlf "0 : no" crlf "1 : yes" crlf)
		(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Karna ikan kecil, udang, atau sejenis pelankton. Bermanfaat sebagai pakan alami ikan
		yang menyebabkan ikan terhindar dari penyakit" crlf)
	) (if (= ?x 0)
		then (printout t crlf "Tetap selalu memberikan pakan ikan berkualitas setiap hari" crlf)
	)
	)
)


; rule kedua dijawab no, pada askeddiseaseinfection
(defrule maintain2 (askeddiseaseinfection no)
	=>
	(printout t crlf "apakah anda selalu  merawat keramba ikan setiap harinya?" crlf "0 : no" crlf "1 : yes" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Tetap selalu merawat keramba ikan dengan baik :)" crlf)
	) (if (= ?x 0)
		then (printout t crlf "apakah di sekitar keramba ikan anda, banyak ikan kecil, udang, atau sejenis pelankton
		yang dapat dimakan oleh ikan?" crlf "0 : no" crlf "1 : yes" crlf)
		(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Karna ikan kecil, udang, atau sejenis pelankton. Bermanfaat sebagai pakan alami ikan
		yang menyebabkan ikan terhindar dari penyakit" crlf)
	) (if (= ?x 0)
		then (printout t crlf "Tetap selalu memberikan pakan ikan berkualitas setiap hari" crlf)
	)
	)
)

; rule ketiga dijawab no, pada askedgillparasitediasease
(defrule maintain3 (askedgillparasitediasease no)
	=>
	(printout t crlf "apakah anda selalu  merawat keramba ikan setiap harinya?" crlf "0 : no" crlf "1 : yes" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Tetap selalu merawat keramba ikan dengan baik :)" crlf)
	) (if (= ?x 0)
		then (printout t crlf "apakah di sekitar keramba ikan anda, banyak ikan kecil, udang, atau sejenis pelankton
		yang dapat dimakan oleh ikan?" crlf "0 : no" crlf "1 : yes" crlf)
		(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Karna ikan kecil, udang, atau sejenis pelankton. Bermanfaat sebagai pakan alami ikan
		yang menyebabkan ikan terhindar dari penyakit" crlf)
	) (if (= ?x 0)
		then (printout t crlf "Tetap selalu memberikan pakan ikan berkualitas setiap hari" crlf)
	)
	)
)