From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 3/3] syslog: document all type options
Date: Thu, 14 Feb 2008 19:54:06 +0100
Message-ID: <47B48E4E.8080002@gmail.com>
References: <1202861911.426160.527338481577.qpush@pokey>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1202861911.426160.527338481577.qpush@pokey>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Jeremy.  Applied for man-pages-2.79.

One comment below.

Jeremy Kerr wrote:
> The type=6 and above options to syslog aren't documented, so
> add a sentence about each.
> 
> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> 
> ---
> 
>  man2/syslog.2 |   33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> Index: man-pages-2.77/man2/syslog.2
> ===================================================================
> --- man-pages-2.77.orig/man2/syslog.2
> +++ man-pages-2.77/man2/syslog.2
> @@ -115,6 +115,39 @@ The call
>  .RI (5, dummy , idummy )
>  only executes the "clear ring buffer" command.
>  
> +The call
> +.BR syslog ()
> +.RI (6, dummy , dummy )

Here you are replicating a bad formatting glitch that I introduced a while
back when doing a semiautomated edit of this page a while back.

I reformatted these as simply

.I syslog(6,dummy,dummy)

etc.

Cheers,

Michael

> +sets the console log level to minimum, so that no messages are printed
> +to the console.
> +
> +The call
> +.BR syslog ()
> +.RI (7, dummy , dummy )
> +sets the console log level to default, so that messages are printed
> +to the console.
> +
> +The call
> +.BR syslog ()
> +.RI (8, dummy , level )
> +sets the console log level to
> +.IR level .
> +Which is an integer between 1 and 8 (inclusive).

I made that last piece:

The call
.I syslog(8,dummy,level)
sets the console log level to
.IR level ,
which must be an integer between 1 and 8 (inclusive).

> +See the
> +.B loglevel
> +section for details.
> +
> +The call
> +.BR syslog ()
> +.RI (9, dummy , dummy )
> +queries and returns the number of bytes currently available to be read
> +on the kernel log buffer.
> +
> +The call
> +.BR syslog ()
> +.RI (10, dummy , dummy )
> +queries and returns the total size of the kernel log buffer.
> +
>  .B The loglevel
>  .br
>  The kernel routine
> 

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
