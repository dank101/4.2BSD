;; lversion.l
;;				-[Fri Aug 19 13:22:41 1983 by jkf]-
;;
;; this defines this symbols:
;;   this-liszt-version-built: ctime string which tells when this liszt
;;	was built.
;;   compiler-name: the banner printed out when liszt starts up

;; this file is not sccsed because it only contains version number
;; information.

(setq this-liszt-version-built (status ctime))

(setq compiler-name
   (concat "Liszt "
	   #.(cond ((status feature for-vax) "vax")
		   ((status feature for-68k) "68000")
		   (t "unknown machine"))
	   " version 8.36"))
