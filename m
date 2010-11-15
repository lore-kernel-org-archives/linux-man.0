From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: About thread-safety information in library functions' man-pages
Date: Mon, 15 Nov 2010 14:37:53 +0800
Message-ID: <4CE0D541.8030807@cn.fujitsu.com>
References: <4C7C9EA6.90609@cn.fujitsu.com> <AANLkTimcJ4kSuB-vZSY2_CYDs12S0ODup9-Y9yj-uQrJ@mail.gmail.com> <4C8DEC85.8030007@cn.fujitsu.com> <AANLkTikVuuZ1N6C5T+GwbgQEH7EAxXPvqrmATZgcM-gE@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020003020700000306030803"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikVuuZ1N6C5T+GwbgQEH7EAxXPvqrmATZgcM-gE-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: pasky-AlSwsSmVLrQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--------------020003020700000306030803
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

Hi Michael,

Michael Kerrisk said the following on 2010-11-14 14:40:
> Sorry for the very long delay in following up on this. I'm reflecting
> on this a little more. My idea is that the ATTRIBUTES section might
> eventually contain multiple subsections, but for now, we have just
> "Multithreading", which mentions thread safety, cancellation safety,
> and async-cancel-safety. And I think it might be better to place this
> section just above (rather than just below) VERSIONS. So, I'd fine
> tune things a little, with a patch something like this for
> man-pages(7).
> 
> ===
> @@ -180,6 +180,7 @@
>  .\" SECURITY,
>  ENVIRONMENT
>  FILES
> +ATTRIBUTES         [Normally only in Sections 2, 3]
>  VERSIONS           [Normally only in Sections 2, 3]
>  CONFORMING TO
>  NOTES
> @@ -202,7 +203,7 @@
> 
>  The following list elaborates on the contents of each of
>  the above sections.
> -.TP 14
> +.TP 10
>  .B NAME
>  The name of this manual page.
>  See
> @@ -316,6 +317,28 @@
>  .\" section).
>  .\" However, please include security information somewhere!
>  .TP
> +.B ATTRIBUTES
> +A summary of various attributes of the function(s) documented on this page,
> +broken into subsections.
> +The following subsections are defined:
> +.sp
> +.RS
> +.TP
> +.B "Multithreading (see pthreads(7))"
> +This subsection notes attributes relating to multithreaded applications:
> +.RS
> +.IP * 3
> +Whether the function is thread-safe.
> +.IP *
> +Whether the function is a cancellation point.
> +.IP *
> +Whether the function is async-cancel-safe.
> +.RE
> +.IP
> +Details of these attributes can be found in
> +.BR pthreads (7).
> +.RE
> +.TP
>  .B VERSIONS
>  A brief summary of the Linux kernel or glibc versions where a
>  system call or library function appeared,
> ===
> 
> Then for the individual pages, the patches might look like this:
> ===
> --- a64l.3	2010-11-01 08:07:38.000000000 +0100
> +++ a64l.3.attr	2010-11-14 07:34:42.000000000 +0100
> @@ -56,6 +56,15 @@
>  .fi
>  .RE
>  So 123 = 59*64^0 + 1*64^1 = "v/".
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR l64a ()
> +function is not thread-safe.
> +.LP
> +The
> +.BR a64l ()
> +function is thread-safe.
>  .SH "CONFORMING TO"
>  POSIX.1-2001.
>  .SH NOTES
> ===
> 
> How does that sound?
> 

  It sounds good. I will post more patches in this format.

> Now, before we apply a vast number of patches, it might be good to
> build a list of pages and the kinds of changes that would be needed
> for each (look at the latest pthreads(7) page in git for some starting
> points on functions that fall into the various categories; possibly
> your research has revealed additional information about the actual
> details in glibc). Could you come up with such lists? (They don't need
> to be complete or comprehensive, but it could be helpful to have a
> picture of where we might start making changes.)
> 

  Do you mean the attached list?

> Thanks,
> 
> Michael
> 

-- 
Best Regards,
Peng Haitao

--------------020003020700000306030803
Content-Type: text/plain;
 name="man3_list"
Content-Disposition: attachment;
 filename="man3_list"
Content-Transfer-Encoding: quoted-printable

Safe functions' list:=0Acloselog=0Adladdr=0Aendutent=0Aendutxent=0A=5Fflush=
lbf=0Agai=5Fcancel=0Ainitstate=0Alckpwdf=0Aopenlog=0Aputchar=0Arand=0Arando=
m=0Asetstate=0Asrand=0Asrandom=0Aulckpwdf=0Aunsetenv=0A=0ASafe with excepti=
ons functions' list:=0Adl=5Fiterate=5Fphdr=0Agetutent=5Fr=0Agetutid=5Fr=0Ag=
etutline=5Fr=0Apututline=0Apututxline=0Asetutent=0Asetutxent=0A=0AUnsafe fu=
nctions' list:=0Aabort
bindresvport
bsd=5Fsignal
clearerr=5Funlocked
drand48
ecvt
erand48
ether=5Faton
fcloseall
feof=5Funlocked
ferror=5Funlocked
fflush=5Funlocked
fputc=5Funlocked
fread=5Funlocked
=5F=5Ffsetlocking
hsearch
jrand48
l64a
lcong48
localeconv
longjmp
lrand48
mrand48
nrand48
profil
pthread=5Fexit
pthread=5Fsetcancelstate
pthread=5Fsetcanceltype
pthread=5Ftestcancel
ptsname
putchar=5Funlocked
putc=5Funlocked
seed48
setjmp
siginterrupt
siglongjmp
srand48
ssignal
strfry
strtok=0A=0AMT-Safe functions' list:=0Aa64l
abs
adjtime
aio=5Ferror
aio=5Freturn
alloca
argz=5Fcount
argz=5Fextract
argz=5Fnext
argz=5Fstringify
asinh
asinhf
asinhl
atan
atanf
atanl
backtrace=5Fsymbols=5Ffd
basename
bcmp
bcopy
bzero
catgets
cbc=5Fcrypt
cbrt
cbrtf
cbrtl
ceil
ceilf
ceill
cexp
cexpf
cexpl
cfgetispeed
cfgetospeed
cfmakeraw
cfsetispeed
cfsetospeed
cfsetspeed
cimag
cimagf
cimagl
clearerr
clnt=5Fcontrol
clnt=5Fgeterr
clock=5Fgetcpuclockid
clock=5Fgetres
clock=5Fgettime
clock=5Fsettime
conj
conjf
conjl
copysign
copysignf
copysignl
cos
cosf
cosl
cproj
cprojf
cprojl
creal
crealf
creall
daemon
des=5Fsetparity
difftime
dirfd
dirname
div
dn=5Fcomp
drand48=5Fr
dysize
eaccess
ecb=5Fcrypt
ecvt=5Fr
envz=5Fentry
envz=5Fget
envz=5Fstrip
erand48=5Fr
erf
erfc
erfcf
erfcl
erff
erfl
ether=5Faton=5Fr
ether=5Fline
euidaccess
eventfd=5Fread
eventfd=5Fwrite
execv
expm1
expm1f
expm1l
fabs
fabsf
fabsl
=5F=5Ffbufsize
FD=5FCLR
fdim
fdimf
fdiml
FD=5FISSET
feclearexcept
fedisableexcept
feenableexcept
fegetenv
fegetexcept
fegetexceptflag
fegetround
feholdexcept
feof
feraiseexcept
ferror
fesetenv
fesetexceptflag
fesetround
fetestexcept
feupdateenv
fflush
ffs
ffsl
ffsll
fileno
fileno=5Funlocked
finite
finitef
finitel
=5F=5Fflbf
flockfile
floor
floorf
floorl
fma
fmaf
fmal
fmax
fmaxf
fmaxl
fmin
fminf
fminl
fpathconf
fpclassify
=5F=5Ffpending
fputc
fread
=5F=5Ffreadable
=5F=5Ffreading
frexp
frexpf
frexpl
fstatvfs
ftime
ftok
ftrylockfile
fts=5Fset
funlockfile
futimens
futimes
=5F=5Ffwritable
=5F=5Ffwriting
gai=5Ferror
getdirentries
getloadavg
getpt
getsubopt
getutmp
getutmpx
getw
gnu=5Fdev=5Fmajor
gnu=5Fdev=5Fmakedev
gnu=5Fdev=5Fminor
gnu=5Fget=5Flibc=5Frelease
gnu=5Fget=5Flibc=5Fversion
gsignal
hasmntopt
hsearch=5Fr
htonl
htons
iconv
ilogb
ilogbf
ilogbl
imaxabs
imaxdiv
index
inet=5Flnaof
inet=5Fmakeaddr
inet=5Fnetof
inet=5Fnetwork
inet=5Fpton
initstate=5Fr
insque
isascii
isatty
isfinite
isgreater
isgreaterequal
isinf
isinff
isinfl
isless
islessequal
islessgreater
isnan
isnanf
isnanl
isnormal
isunordered
iswctype
jrand48=5Fr
klogctl
labs
lcong48=5Fr
ldexp
ldexpf
ldexpl
ldiv
llabs
lldiv
llrint
llrintf
llrintl
llround
llroundf
llroundl
lockf
log1p
log1pf
log1pl
logb
logbf
logbl
login=5Ftty
logwtmp
lrand48=5Fr
lrint
lrintf
lrintl
lround
lroundf
lroundl
lseek64
lutimes
makecontext
matherr
mbsinit
memccpy
memchr
memcmp
memcpy
memfrob
memmem
memmove
mempcpy
memrchr
memset
mkdtemp
mkfifo
mkfifoat
mkostemp
mkostemps
mkstemp
mkstemps
mktemp
mmap64
modf
modff
modfl
mq=5Fclose
mq=5Fgetattr
mq=5Fopen
mq=5Freceive
mq=5Fsend
mq=5Fsetattr
mq=5Ftimedreceive
mq=5Ftimedsend
mq=5Funlink
mrand48=5Fr
nearbyint
nearbyintf
nearbyintl
nextafter
nextafterf
nextafterl
nexttoward
nexttowardf
nexttowardl
nrand48=5Fr
ntohl
ntohs
passwd2des
pathconf
posix=5Ffallocate
posix=5Fopenpt
pthread=5Fattr=5Fgetdetachstate
pthread=5Fattr=5Fgetguardsize
pthread=5Fattr=5Fgetinheritsched
pthread=5Fattr=5Fgetschedparam
pthread=5Fattr=5Fgetschedpolicy
pthread=5Fattr=5Fgetscope
pthread=5Fattr=5Fgetstack
pthread=5Fattr=5Fgetstackaddr
pthread=5Fattr=5Fgetstacksize
pthread=5Fattr=5Finit
pthread=5Fattr=5Fsetdetachstate
pthread=5Fattr=5Fsetguardsize
pthread=5Fattr=5Fsetinheritsched
pthread=5Fattr=5Fsetschedparam
pthread=5Fattr=5Fsetschedpolicy
pthread=5Fattr=5Fsetscope
pthread=5Fattr=5Fsetstack
pthread=5Fattr=5Fsetstackaddr
pthread=5Fattr=5Fsetstacksize
pthread=5Fcleanup=5Fpush
pthread=5Fequal
pthread=5Fgetaffinity=5Fnp
pthread=5Fgetconcurrency
pthread=5Fgetcpuclockid
pthread=5Fgetschedparam
pthread=5Fkill
pthread=5Fkill=5Fother=5Fthreads=5Fnp
pthread=5Fself
pthread=5Fsetconcurrency
pthread=5Fsetschedparam
pthread=5Fsetschedprio
pthread=5Fsigmask
pthread=5Fyield
ptsname=5Fr
putc
raise
random=5Fr
rand=5Fr
rawmemchr
readdir
readdir=5Fr
remove
remque
remquo
remquof
remquol
rewinddir
rindex
rint
rintf
rintl
round
roundf
roundl
rresvport
rtime
scalbln
scalblnf
scalblnl
scalbn
scalbnf
scalbnl
sched=5Fgetcpu
seed48=5Fr
seekdir
sem=5Fdestroy
sem=5Fgetvalue
sem=5Finit
sem=5Fpost
sem=5Ftimedwait
sem=5Ftrywait
sem=5Funlink
sem=5Fwait
setbuf
setbuffer
sethostid
setlinebuf
setlogmask
setstate=5Fr
setvbuf
sigaddset
sigandset
sigblock
sigdelset
sigemptyset
sigfillset
siggetmask
sighold
sigignore
sigisemptyset
sigismember
signbit
significand
significandf
significandl
sigorset
sigpause
sigrelse
sigset
sigsetmask
sigstack
sigvec
sigwait
sin
sincos
sincosf
sincosl
sinf
sinl
sleep
sockatmark
srand48=5Fr
srandom=5Fr
statvfs
stpcpy
stpncpy
strcat
strchr
strchrnul
strcmp
strcpy
strcspn
strdupa
strlen
strncat
strncmp
strncpy
strndupa
strnlen
strpbrk
strrchr
strsep
strspn
strstr
strtok=5Fr
strverscmp
swab
swapcontext
system
sysv=5Fsignal
tan
tanf
tanh
tanhf
tanhl
tanl
tcdrain
tcflow
tcflush
tcgetattr
tcgetpgrp
tcgetsid
tcsendbreak
tcsetattr
tcsetpgrp
telldir
toascii
towctrans
trunc
truncf
truncl
ualarm
ungetc
ungetwc
unlockpt
updwtmp
updwtmpx
usleep
va=5Farg
va=5Fcopy
va=5Fend
va=5Fstart
versionsort
vlimit
vtimes
wcpcpy
wcpncpy
wcscat
wcschr
wcscmp
wcscpy
wcscspn
wcslen
wcsncat
wcsncmp
wcsncpy
wcsnlen
wcspbrk
wcsrchr
wcsspn
wcsstr
wcstok
wmemchr
wmemcmp
wmemcpy
wmemmove
wmempcpy
wmemset
xdrmem=5Fcreate
xdrstdio=5Fcreate
xdr=5Fvoid
=0AMT-Safe with exceptions functions' list:=0Aatof
atoi
atol
atoll
bsearch
clnt=5Fcall
clnt=5Fdestroy
clnt=5Ffreeres
ctermid
inet=5Faddr
inet=5Faton
isalnum
isalpha
isblank
iscntrl
isdigit
isgraph
islower
isprint
ispunct
isspace
isupper
iswalnum
iswalpha
iswblank
iswcntrl
iswdigit
iswgraph
iswlower
iswprint
iswpunct
iswspace
iswupper
iswxdigit
isxdigit
lfind
lsearch
mbstowcs
nl=5Flanginfo
pthread=5Fcleanup=5Fpop
sgetspent=5Fr
strcasecmp
strcasestr
strncasecmp
strtod
strtof
strtoimax
strtol
strtold
strtoll
strtoq
strtoul
strtoull
strtoumax
strtouq
svcerr=5Fauth
svcerr=5Fdecode
svcerr=5Fnoproc
svcerr=5Fnoprog
svcerr=5Fprogvers
svcerr=5Fsystemerr
svcerr=5Fweakauth
svc=5Fsendreply
tdestroy
tfind
tolower
toupper
towlower
towupper
twalk
wcscasecmp
wcsncasecmp
wcstoimax
wcstoumax
wcswidth
wctrans
wctype
wcwidth
xdr=5Fbool
xdr=5Fcallhdr
xdr=5Fchar
xdr=5Fdouble
xdr=5Fenum
xdr=5Ffloat
xdr=5Ffree
xdr=5Fint
xdr=5Flong
xdr=5Fopaque
xdr=5Fpmap
xdrrec=5Fendofrecord
xdrrec=5Feof
xdrrec=5Fskiprecord
xdr=5Frejected=5Freply
xdr=5Freplymsg
xdr=5Fshort
xdr=5Fu=5Fchar
xdr=5Fu=5Fint
xdr=5Fu=5Flong
xdr=5Funion
xdr=5Fu=5Fshort
xdr=5Fvector=0A=

--------------020003020700000306030803--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
