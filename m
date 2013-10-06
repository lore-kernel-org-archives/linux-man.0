From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 62581] New: Make pdfdocs fails on xubuntu 13.04 with linux
 kernel 12.3. r3
Date: Sun, 06 Oct 2013 03:06:58 +0000
Message-ID: <bug-62581-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=62581

            Bug ID: 62581
           Summary: Make pdfdocs fails on xubuntu 13.04 with linux kernel
                    12.3. r3
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nickkrause-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org
        Regression: No

Created attachment 110301
  --> https://bugzilla.kernel.org/attachment.cgi?id=110301&action=edit
This is the output

I have tried to make the documation by pdf for the last few days and can't get
it to work on psdocs xml or pdf but only on html docs , here is the output ,
it's a bit lenghty put I hope it helps as I would like to have to docs in pdf
form 
nick@nick-System-Product-Name:~$ make pdfdocs
make: *** No rule to make target `pdfdocs'.  Stop.
nick@nick-System-Product-Name:~$ cd linus-tree/
nick@nick-System-Product-Name:~/linus-tree$ make pdfdocs
  DOCPROC Documentation/DocBook/z8530book.xml
  PDF     Documentation/DocBook/z8530book.pdf
Using catalogs: /etc/sgml/catalog
Using stylesheet: /usr/share/docbook-utils/docbook-utils.dsl#print
Working on: /home/nick/linus-tree/Documentation/DocBook/z8530book.xml
Done.
  DOCPROC Documentation/DocBook/device-drivers.xml
Warning(/home/nick/linus-tree//kernel/sched/fair.c:4704): Excess function
parameter 'balance' description in 'update_sd_lb_stats'
Warning(/home/nick/linus-tree//kernel/sys.c): no structured comments found
Warning(/home/nick/linus-tree//drivers/base/dd.c:60): No description found for
parameter 'work'
Warning(/home/nick/linus-tree//drivers/base/reservation.c): no structured
comments found
Warning(/home/nick/linus-tree//include/linux/reservation.h): no structured
comments found
Warning(/home/nick/linus-tree//drivers/base/power/main.c:1038): No description
found for parameter 'info'
Warning(/home/nick/linus-tree//drivers/acpi/scan.c): no structured comments
found
Warning(/home/nick/linus-tree//include/linux/spi/spi.h:620): No description
found for parameter 'frame_length'
  PDF     Documentation/DocBook/device-drivers.pdf
Using catalogs: /etc/sgml/catalog
Using stylesheet: /usr/share/docbook-utils/docbook-utils.dsl#print
Working on: /home/nick/linus-tree/Documentation/DocBook/device-drivers.xml
Done.
  DOCPROC Documentation/DocBook/kernel-hacking.xml
  PDF     Documentation/DocBook/kernel-hacking.pdf
Using catalogs: /etc/sgml/catalog
Using stylesheet: /usr/share/docbook-utils/docbook-utils.dsl#print
Working on: /home/nick/linus-tree/Documentation/DocBook/kernel-hacking.xml
This is pdfTeX, Version 3.1415926-2.4-1.40.13 (TeX Live 2012/Debian)
 restricted \write18 enabled.
entering extended mode
(/home/nick/linus-tree/Documentation/DocBook/kernel-hacking.tex
JadeTeX 2003/04/27: 3.13
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1ptm.fd)
Elements will be labelled
Jade begin document sequence at 20
No file kernel-hacking.aux.
(/usr/share/texmf/tex/latex/tipa/t3ptm.fd)
(/usr/share/texlive/texmf-dist/tex/latex/base/ts1cmr.fd)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd) [1.0.23{/var/lib/texm
f/fonts/map/pdftex/updmap/pdftex.map}]
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/ts1ptm.fd) [2.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 315.


LaTeX Warning: Reference `0:introduction' on page iii undefined on input line 3
72.


LaTeX Warning: Reference `0:basic-players' on page iii undefined on input line 
406.


LaTeX Warning: Reference `0:basics-usercontext' on page iii undefined on input 
line 432.


LaTeX Warning: Reference `0:basics-hardirqs' on page iii undefined on input lin
e 457.


LaTeX Warning: Reference `0:basics-softirqs' on page iii undefined on input lin
e 482.


LaTeX Warning: Reference `0:basic-rules' on page iii undefined on input line 51
6.


LaTeX Warning: Reference `0:ioctls' on page iii undefined on input line 550.


LaTeX Warning: Reference `0:deadlock-recipes' on page iii undefined on input li
ne 584.


LaTeX Warning: Reference `0:common-routines' on page iii undefined on input lin
e 618.

(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pcr.fd)

LaTeX Warning: Reference `0:routines-printk' on page iii undefined on input lin
e 655.


LaTeX Warning: Reference `0:routines-copy' on page iii undefined on input line 
705.


LaTeX Warning: Reference `0:routines-kmalloc' on page iii undefined on input li
ne 746.


LaTeX Warning: Reference `0:routines-current' on page iii undefined on input li
ne 782.


LaTeX Warning: Reference `0:routines-udelay' on page iii undefined on input lin
e 829.


LaTeX Warning: Reference `0:routines-endian' on page iii undefined on input lin
e 880.


LaTeX Warning: Reference `0:routines-local-irqs' on page iii undefined on input
 line 921.


LaTeX Warning: Reference `0:routines-softirqs' on page iii undefined on input l
ine 962.


LaTeX Warning: Reference `0:routines-processorids' on page iii undefined on inp
ut line 998.


LaTeX Warning: Reference `0:routines-init' on page iii undefined on input line 
1041.


LaTeX Warning: Reference `0:routines-init-again' on page iii undefined on input
 line 1082.


LaTeX Warning: Reference `0:routines-moduleexit' on page iii undefined on input
 line 1118.


LaTeX Warning: Reference `0:routines-module-use-counters' on page iii undefined
 on input line 1159.


LaTeX Warning: Reference `0:queues' on page iii undefined on input line 1199.


LaTeX Warning: Reference `0:queue-declaring' on page iii undefined on input lin
e 1225.


LaTeX Warning: Reference `0:queue-waitqueue' on page iii undefined on input lin
e 1250.


LaTeX Warning: Reference `0:queue-waking' on page iii undefined on input line 1
275.


LaTeX Warning: Reference `0:atomic-ops' on page iii undefined on input line 130
9.


LaTeX Warning: Reference `0:symbols' on page iii undefined on input line 1343.


LaTeX Warning: Reference `0:sym-exportsymbols' on page iii undefined on input l
ine 1380.


LaTeX Warning: Reference `0:sym-exportsymbols-gpl' on page iii undefined on inp
ut line 1416.


LaTeX Warning: Reference `0:conventions' on page iii undefined on input line 14
50.


LaTeX Warning: Reference `0:conventions-doublelinkedlist' on page iii undefined
 on input line 1482.


LaTeX Warning: Reference `0:convention-returns' on page iii undefined on input 
line 1507.


LaTeX Warning: Reference `0:conventions-borkedcompile' on page iii undefined on
 input line 1532.


LaTeX Warning: Reference `0:conventions-initialising' on page iii undefined on 
input line 1557.


LaTeX Warning: Reference `0:conventions-gnu-extns' on page iii undefined on inp
ut line 1582.


LaTeX Warning: Reference `0:conventions-cplusplus' on page iii undefined on inp
ut line 1607.


LaTeX Warning: Reference `0:conventions-ifdef' on page iii undefined on input l
ine 1632.


LaTeX Warning: Reference `0:submitting' on page iii undefined on input line 166
6.


LaTeX Warning: Reference `0:cantrips' on page iii undefined on input line 1700.



LaTeX Warning: Reference `0:credits' on page iii undefined on input line 1734.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 1734.

[3.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 1825.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 1825.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 1917.

pdfTeX warning (ext4): destination with the same identifier (name{page.1}) has 
been already used, duplicate ignored
<to be read again> 
                   \relax 
l.1917   \endPar{}\endNode{}\endSeq{}\endSpS
                                            {}\endNode{}\Node% [1.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 2004.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 2004.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 2499.

pdfTeX warning (ext4): destination with the same identifier (name{page.2}) has 
been already used, duplicate ignored
<to be read again> 
                   \relax 
l.2499    \endPar{}
                   \endNode{}\Node% [2.0.23] [3.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 2978.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 2978.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 3217.

[4.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 3304.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 3304.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 3601.

[5.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 3688.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 3688.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 3908.

[6.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 3995.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 3995.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 4357.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 4357.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 4357.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 4357.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 4459.

[7.0.23] [8.0.23]

Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5193.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5193.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5193.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5193.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5193.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5193.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5193.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5193.


Overfull \hbox (31.63298pt too wide) in paragraph at lines 5161--5193
\T1/pcr/b/n/15.552 cpu_to_be32()\T1/phv/b/n/17.28 /\T1/pcr/b/n/15.552 be32_to_c
pu()\T1/phv/b/n/17.28 /\T1/pcr/b/n/15.552 cpu_to_le32()\T1/phv/b/n/17.28 /\T1/p
cr/b/n/15.552 le32_to_cpu() 

Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5314.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5314.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5314.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5314.

[9.0.23]

Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5409.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5409.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5409.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5409.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5486.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5486.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5601.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5601.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5601.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5601.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5601.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5601.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5703.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5703.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5703.

[10.0.23]

Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5845.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5946.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5946.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 5946.

[11.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 6112.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 6112.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 6507.

[12.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 6594.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 6594.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 6832.

[13.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 6919.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 6919.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 7045.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 7119.


Package hyperref Warning: Token not allowed in a PDF string (PDFDocEncoding):
(hyperref)                removing `subscript' on input line 7119.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 7156.

[14.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 7243.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 7243.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 7676.

[15.0.23]
! Undefined control sequence.
\Hy@wrapper@babel ...set@display@protect \edef \x 
                                                  {#2}\@onelevel@sanitize \x...
l.8154 \endHeadPar{}
                    \endSeq{}\Node%
! Argument of \HyWrap@new@pdflink has an extra }.
<inserted text> 
                \par 
l.8154 \endHeadPar{}
                    \endSeq{}\Node%
Runaway argument?
! Paragraph ended before \HyWrap@new@pdflink was complete.
<to be read again> 
                   \par 
l.8154 \endHeadPar{}
                    \endSeq{}\Node%
! Extra \else.
\endHeadPar ...headingTwo}{1}{\HeadingText }\else 
                                                  \ifnum \HeadingLevel =3\ad...
l.8154 \endHeadPar{}
                    \endSeq{}\Node%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8172 {1}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8191 {0}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8204 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8204 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8204 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8204 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8204 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8204 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8204 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8212 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8212 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8212 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8212 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8212 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8212 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8212 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8212 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8225 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8225 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8225 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8240 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8240 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8240 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8240 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8240 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8240 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8240 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8248 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8248 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8248 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8248 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8248 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8248 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8248 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8248 ... the Kernel\endSeq{}\endNode{}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8261 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8261 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8261 {}\endSeq{}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8263 {}
         \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8263 {}
         \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8263 {}
         \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8263 {}
         \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8263 {}
         \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8263 {}
         \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8264 {}
         \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8265 {}
         \HeadPar%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8281 {1}}
           Chapter 11. \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8282 {}
         \Node%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8307 {1}}
           \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8308 {}
         \endSeq{}\endPar{}\endSeq{}\Node%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8326 {1}}

! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8339 {1}}
           \Node%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8344 {0}}
           \Par%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8353 {1}}
           \Seq%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8354 {}
         \LineField%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8360 {0}}
           \Character{8226}\endLineField{}\endSeq{}\Node%
! Use of \begin doesn't match its definition.
\LineField ...ieldNIC \FlowObjectSetup {0}\begin {
                                                  LRbox}{\dssslbox }
l.8360 {0}}
           \Character{8226}\endLineField{}\endSeq{}\Node%
! Use of \\pdfbookmark doesn't match its definition.
\SetupICs ...mName \endcsname \fi }}\set@fontsize 
                                                  \baselinestretch {\fSize }...
l.8360 {0}}\Character{8226}
                           \endLineField{}\endSeq{}\Node%
! Use of \end doesn't match its definition.
\endLineField ->\end {
                      LRbox}\ifdim \wd \dssslbox >\FieldWidth \def \FieldWid...
l.8360 {0}}\Character{8226}\endLineField
                                        {}\endSeq{}\Node%
! Missing \endcsname inserted.
<to be read again> 
                   \expandafter 
l.8360 {0}}\Character{8226}\endLineField
                                        {}\endSeq{}\Node%
! Extra \endcsname.
\HyPsd@@LetCommand ...ter \expandafter \endcsname 
                                                  \fi \fi 
l.8360 {0}}\Character{8226}\endLineField
                                        {}\endSeq{}\Node%
[16.0.23] [17.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 8674.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 8674.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 8948.

[18.0.23] [19.0.23]

Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 9089.


Package Fancyhdr Warning: \fancyhead's `E' option without twoside option is use
less on input line 9089.


Package Fancyhdr Warning: \fancyfoot's `E' option without twoside option is use
less on input line 9164.

[20.0.23] (/home/nick/linus-tree/Documentation/DocBook/kernel-hacking.aux)

Package rerunfilecheck Warning: File `kernel-hacking.out' has changed.
(rerunfilecheck)                Rerun to get outlines right
(rerunfilecheck)                or use package `bookmark'.


LaTeX Warning: There were undefined references.

 )
(\end occurred inside a group at level 1)

### semi simple group (level 1) entered at line 7171 (\begingroup)
### bottom level
(\end occurred when \ifnum on line 8287 was incomplete)
(\end occurred when \ifnum on line 8154 was incomplete)
(see the transcript file for additional information)pdfTeX warning (dest): name
{0:submitting} has been referenced but does not exist, replaced by a fixed one

{/usr/share/texlive/texmf-dist/fonts/enc/dvips/base/8r.enc}</usr/share/texlive/
texmf-dist/fonts/type1/urw/courier/ucrb8a.pfb></usr/share/texlive/texmf-dist/fo
nts/type1/urw/courier/ucrr8a.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw
/courier/ucrro8a.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uh
vb8a.pfb></usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvbo8a.pfb></
usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb></usr/share/te
xlive/texmf-dist/fonts/type1/urw/times/utmb8a.pfb></usr/share/texlive/texmf-dis
t/fonts/type1/urw/times/utmr8a.pfb></usr/share/texlive/texmf-dist/fonts/type1/u
rw/times/utmri8a.pfb>
Output written on kernel-hacking.pdf (23 pages, 162320 bytes).
Transcript written on kernel-hacking.log.
make[1]: *** [Documentation/DocBook/kernel-hacking.pdf] Error 9
make: *** [pdfdocs] Error 2

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
