From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Trivial punctuation fixes in SEE ALSO
Date: Fri, 13 Feb 2009 07:43:07 +1300
Message-ID: <cfd18e0f0902121043i76dc2dcl23736d09b7f41e5b@mail.gmail.com>
References: <1234436392-28170-1-git-send-email-kir@openvz.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1234436392-28170-1-git-send-email-kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Kir,

On Thu, Feb 12, 2009 at 11:59 PM, Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org> wrote:
> In SEE ALSO, when a few man pages are referenced, those are divided by commas.
> Every reference is on a separate line, and all lines but the last one should
> end with comma. I spotted one place where there is no comma in between
> references, and mocked up an awk script to find similar places:
>
> for f in man*/*; do awk '/^.SH ["]SEE ALSO["]/ {sa=1; print "== " FILENAME " =="; print; next } /^\.(PP|SH)/ {sa=0; no=0; next} /^\.BR/ { if (sa==1) { print; if (no == 1) print "Missing comma in " FILENAME " +" FNR-1; no=0 } } /^\.BR .*)$/ { if (sa==1) no=1; next } /\.\\"/ {next} /.*/ { if (sa==1) { print; next }}' $f; done | fgrep 'Missing comma'
>
> This patch fixes all the places found by the above script.
>
> Also, there is an extra dot at the end of uri.7 "SEE ALSO" section.
> Removed as per man-pages(7) recommendation.

Thanks both for the patch, and the script!  Applied for 3.19.

Cheers,

Michael

> Signed-off-by: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
>  man2/fork.2       |    2 +-
>  man3/raise.3      |    2 +-
>  man3/sin.3        |    2 +-
>  man7/koi8-r.7     |    4 ++--
>  man7/rtld-audit.7 |    2 +-
>  man7/uri.7        |    2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/man2/fork.2 b/man2/fork.2
> index 3f62352..ce93b3e 100644
> --- a/man2/fork.2
> +++ b/man2/fork.2
> @@ -219,6 +219,6 @@ and
>  .BR unshare (2),
>  .BR vfork (2),
>  .BR wait (2),
> -.BR daemon (3)
> +.BR daemon (3),
>  .BR capabilities (7),
>  .BR credentials (7)
> diff --git a/man3/raise.3 b/man3/raise.3
> index 392f305..8814abf 100644
> --- a/man3/raise.3
> +++ b/man3/raise.3
> @@ -66,5 +66,5 @@ C89, C99, POSIX.1-2001.
>  .BR kill (2),
>  .BR sigaction (2),
>  .BR signal (2),
> -.BR pthread_kill (3)
> +.BR pthread_kill (3),
>  .BR signal (7)
> diff --git a/man3/sin.3 b/man3/sin.3
> index 109fd16..9f0d1e9 100644
> --- a/man3/sin.3
> +++ b/man3/sin.3
> @@ -110,5 +110,5 @@ SVr4, 4.3BSD, C89.
>  .BR atan2 (3),
>  .BR cos (3),
>  .BR csin (3),
> -.BR sincos (3)
> +.BR sincos (3),
>  .BR tan (3)
> diff --git a/man7/koi8-r.7 b/man7/koi8-r.7
> index 5462e47..70ac4d7 100644
> --- a/man7/koi8-r.7
> +++ b/man7/koi8-r.7
> @@ -188,7 +188,7 @@ _
>  .TE
>  .SH "SEE ALSO"
>  .BR ascii (7),
> -.BR iso-8859-7 (7)
> -.BR koi8-u (7)
> +.BR iso-8859-7 (7),
> +.BR koi8-u (7),
>  RFC\ 1489,
>  http://koi8.pp.ru/
> diff --git a/man7/rtld-audit.7 b/man7/rtld-audit.7
> index f087d7a..0eb1d8f 100644
> --- a/man7/rtld-audit.7
> +++ b/man7/rtld-audit.7
> @@ -594,5 +594,5 @@ la_i86_gnu_pltenter(Elf32_Sym *sym, unsigned int ndx,
>  .SH "SEE ALSO"
>  .BR ldd (1),
>  .BR dlopen (3),
> -.BR ld.so (8)
> +.BR ld.so (8),
>  .BR ldconfig (8)
> diff --git a/man7/uri.7 b/man7/uri.7
> index b2951cd..b139375 100644
> --- a/man7/uri.7
> +++ b/man7/uri.7
> @@ -702,5 +702,5 @@ tools) and invokes the right tool for any URI.
>  .BR mailaddr (7),
>  .BR utf-8 (7),
>  .UR http://www.ietf.org/rfc/rfc2255.txt
> -IETF RFC\ 2255.
> +IETF RFC\ 2255
>  .UE
> --
> 1.6.0.6
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
