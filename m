From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/3] syslog: printk isn't posessive, or a contraction
Date: Thu, 14 Feb 2008 19:54:00 +0100
Message-ID: <47B48E48.30300@gmail.com>
References: <1202861911.382843.426327550231.qpush@pokey>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1202861911.382843.426327550231.qpush@pokey>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jeremy,

Jeremy Kerr wrote:
> .. so we don't need the apostrophe. We probably don't need the 's'
> either.

Though as you are probably aware, this kind of use of apostrophes is not
uncommon.  It's one of those interesting gray areas of grammar: it is
derided by proscriptive grammarians, but turns up often in written English
when the writer feels uncomfortable about simply adding an "s" to create
the plural.  Here of course the original author (of the code comments,
taken from kernel/printk.c) wanted a plural but was (rightly) uncomfortable
about simply adding a character to what is a C identifier.

Still, I'm happy to apply your change, since the meaning remains clear, and
 makes the grammarians happy.

Applied for man-pages-2.79.

Cheers,

Michael

> 
> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> 
> ---
> 
>  man2/syslog.2 |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Index: man-pages-2.77/man2/syslog.2
> ===================================================================
> --- man-pages-2.77.orig/man2/syslog.2
> +++ man-pages-2.77/man2/syslog.2
> @@ -62,8 +62,8 @@ Quoting from
>   *      3 \-\- Read up to the last 4k of messages in the ring buffer.
>   *      4 \-\- Read and clear last 4k of messages in the ring buffer
>   *      5 \-\- Clear ring buffer.
> - *      6 \-\- Disable printk's to console
> - *      7 \-\- Enable printk's to console
> + *      6 \-\- Disable printk to console
> + *      7 \-\- Enable printk to console
>   *      8 \-\- Set level of messages printed to console
>   *      9 \-\- Return number of unread characters in the log buffer
>   *     10 \-\- Return size of the log buffer
> 

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
