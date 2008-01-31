From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: waitpid return value when there are no children
Date: Thu, 31 Jan 2008 13:56:37 +0100
Message-ID: <47A1C585.3070402@gmail.com>
References: <1200331148207@dmwebmail.japan.chezphil.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1200331148207-YnoLgZYwwYtZ7UC3SA4GCMGQzZSyEchOYPYVAmT7z5s@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Endecott <phil_vonar_endecott-wZDNlLIRyE5g9hUCZPvPmw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Phil,

Phil Endecott wrote:
> Hi Michael,
> 
> man waitpid says under RETURN VALUE:
> 
>        waitpid(): on success, returns the process ID of the child whose
> state has  changed;  on
>        error,  -1  is returned; if WNOHANG was specified and no
> child(ren) specified by pid has
>        yet changed state, then 0 is returned.
> 
> There is a subtle case when the child has no children at all and you
> call waitpid(-1,NULL,WNOHANG).  To me, the existing wording implies that
> it will return 0.  In fact it returns -1 and ECHILD, as I have
> discovered the hard way :-(.  The SUS documentation is more explicit
> about this, e.g.
> http://www.opengroup.org/onlinepubs/007908799/xsh/wait.html:
> 
> "If waitpid() was invoked with WNOHANG set in options, ****it has at
> least one child process specified by pid for which status is not
> available****, and status is not available for any process specified by
> pid, 0 will be returned. Otherwise, (pid_t)-1 will be returned, and
> errno will be set to indicate the error."
> 
> I suggest the following, which is based on your existing text:
> 
> waitpid(): on success, returns the process ID of the child whose state
> has  changed;
> else if WNOHANG was specified and child(ren) specified by pid exist but
> have not yet changed state, then 0 is returned;
> else an error has occurred and -1 is returned.

You are of course right that the text could be clearer.  Thanks for
pointing that out.

For man-pages-2.77, I've changed the text to:

       waitpid(): on success, returns  the  process  ID  of  the
       child  whose  state has changed; if WNOHANG was specified
       and one or more child(ren) specified by  pid  exist,  but
       have  not  yet  changed  state,  then  0 is returned.  On
       error, -1 is returned.

Cheers,

Michael

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
