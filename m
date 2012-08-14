From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: Re: [patch], iso_8859-*.7: Explanation of SOFT HYPHEN and the code
 for it
Date: Tue, 14 Aug 2012 15:32:10 +0000
Message-ID: <20120814153210.GA12221@rhi.hi.is>
References: <20120510194231.GA13127@rhi.hi.is>
 <CAKgNAkiw4yhNMM2vHdQ4yd2u_T0tLd34wpmUbuH9_ndPpEsg6Q@mail.gmail.com>
 <20120608211539.GA14325@rhi.hi.is>
 <CAKgNAkhWmVyJnsNTdOnascHOEQKY9Gesutyxn2kHeeRo2kx6_A@mail.gmail.com>
 <20120619193019.GA710@rhi.hi.is>
 <CAKgNAkjKkHSKf1C5p5yts8Uuv9LoYFRQFr2JATNxf5fSh+8A_w@mail.gmail.com>
 <20120710234614.GA9921@rhi.hi.is>
 <CAKgNAkip2ddHEmE8wMcA98O7hy5_esTB4_mxidkuMKLYYJ8N=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkip2ddHEmE8wMcA98O7hy5_esTB4_mxidkuMKLYYJ8N=w@mail.gmail.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Tue, Aug 14, 2012 at 12:07:50AM +0200, Michael Kerrisk (man-pages) wrote:
> Hello Bjarni,
> 
> Late follow-up...
> 
> On Wed, Jul 11, 2012 at 1:46 AM, Bjarni Ingi Gislason
> <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> > On Sat, Jul 07, 2012 at 08:01:04AM +0200, Michael Kerrisk (man-pages) wrote:
> >> On Tue, Jun 19, 2012 at 9:30 PM, Bjarni Ingi Gislason
> >> <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> > [removed text]
> >>
> >> Any further update to that last sentence of yours? Is man-pages able
> >> to use that patch you sent?
> >>
> >   I have done nothing in this case, and I suppose that will wait
> > until autumn or winter.
> >
> >   A better solution is to simplify the footnote:
> >
> >   See groff_char(7) (soft hyphen) and the standard ISO 8859-1 (shy)
> > or the equivalent version from your national standardization body.
> 
> So, I applied the patch below. Okay?
> 
> Cheers,
> 
> Michael
> 
> --- a/man7/iso_8859-1.7
> +++ b/man7/iso_8859-1.7
> @@ -71,7 +71,7 @@ manual page.
>  The fourth column will only show the proper glyphs
>  in an environment configured for ISO 8859-1.
>  .TS
> -l l l c lp-1.
> +l2 l2 l2 c2 lp-1.
>  Oct    Dec     Hex     Char    Description
>  _
>  240    160     A0      <A0>    NO-BREAK SPACE
> @@ -87,7 +87,7 @@ _
>  252    170     AA      <AA>    FEMININE ORDINAL INDICATOR
>  253    171     AB      <AB>    LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
>  254    172     AC      <AC>    NOT SIGN
> -255    173     AD      -       SOFT HYPHEN
> +255    173     AD      <AD>    SOFT HYPHEN (shown as a hyphen at line
> breaks) [1]
>  256    174     AE      <AE>    REGISTERED SIGN
>  257    175     AF      <AF>    MACRON
>  260    176     B0      <B0>    DEGREE SIGN
> @@ -171,6 +171,14 @@ _
>  376    254     FE      <FE>    LATIN SMALL LETTER THORN
>  377    255     FF      <FF>    LATIN SMALL LETTER Y WITH DIAERESIS
>  .TE
> +.IP [1] 4
> +See
> +.BR groff_char (7)
> +(soft hyphen) and the standard ISO 8859-1 ("shy",
> +paragraph 6.3.3)
> +or the equivalent version from your national standardization body.
> +.BR "ISO 8859-1:1987" ,
> +paragraph 6.3.3.
>  .SH "SEE ALSO"
>  .BR ascii (7),
>  .BR iso_8859-15 (7)
> 
   O.K., but
1) drop

+.BR "ISO 8859-1:1987" ,
+paragraph 6.3.3.

  The year (1987) is for an older version; paragraph is repeated
from a previous line.  If you want the name of the standard
boldfaced, do it with the first mention of it in the change.

2) The column for "Char" should show the graphic character (glyph)
for the code, and not repeap column 3 (with extra < >)

3) There are no tabs in the table!  Have been changed to spaces!

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
