From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: Re: [patch], mdoc(7): Fixing a warning and a table
Date: Mon, 14 May 2012 19:08:30 +0000
Message-ID: <20120514190830.GA22277@rhi.hi.is>
References: <20120511195430.GA28822@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120511195430.GA28822-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, May 11, 2012 at 07:54:30PM +0000, Bjarni Ingi Gislason wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
> 
>   From "groff -ww ..." (or "man --warnings=w ..."):
> 
> <groff: mdoc.7>:294: warning: tab character in unquoted macro argument
> 
>   In one table the distance between columns is too small in the
> "ps" output.  (Bug in the groff "doc.tmac" macro?)
> 

  My earlier patch for the ".Bl -column" line is wrong

--- mdoc.7	2012-04-26 22:58:40.000000000 +0000
+++ mdoc.7.new	2012-05-14 01:28:45.000000000 +0000
@@ -201,7 +201,7 @@
 Options:
 .Bl -tag -width flag -compact
 .It Ar List-types
-.Bl -column xbullet -compact
+.Bl -column ".Fl bullet" -compact
 .It Fl bullet Ta "Bullet Item List"
 .It Fl item Ta "Unlabeled List"
 .It Fl enum Ta "Enumerated List"
@@ -291,7 +291,7 @@
 .ne 1i
 .Ss Manual Domain Macros
 .Bl -column "Name" "Parsed" Callable" -compact
-.It Em Name	Parsed	Callable	Description
+.It Em "Name	Parsed	Callable	Description"
 .It Li \&Ad Ta Yes Ta Yes Ta "Address. (This macro may be deprecated.)"
 .It Li \&An Ta Yes Ta Yes Ta "Author name."
 .It Li \&Ar Ta Yes Ta Yes Ta "Command-line argument."


>   Patch:
> 
> --- mdoc.7	2012-04-26 22:58:40.000000000 +0000
> +++ mdoc.7.new	2012-05-11 13:57:40.000000000 +0000
> @@ -201,7 +201,10 @@
>  Options:
>  .Bl -tag -width flag -compact
>  .It Ar List-types
> -.Bl -column xbullet -compact
> +.\" The width "xbullet" is too small in the "ps" output.
> +.\" Spaces to increase the width result in too little space in
> +.\" the "ps" output (bug in the groff <= 1.21 "doc.tmac" macro?)
> +.Bl -column xbulletM -compact
>  .It Fl bullet Ta "Bullet Item List"
>  .It Fl item Ta "Unlabeled List"
>  .It Fl enum Ta "Enumerated List"
> @@ -291,7 +294,7 @@
>  .ne 1i
>  .Ss Manual Domain Macros
>  .Bl -column "Name" "Parsed" Callable" -compact
> -.It Em Name	Parsed	Callable	Description
> +.It Em "Name	Parsed	Callable	Description"
>  .It Li \&Ad Ta Yes Ta Yes Ta "Address. (This macro may be deprecated.)"
>  .It Li \&An Ta Yes Ta Yes Ta "Author name."
>  .It Li \&Ar Ta Yes Ta Yes Ta "Command-line argument."
> 
> -- 
> Bjarni I. Gislason

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
