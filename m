From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in RENAME(2)
Date: Sun, 4 Sep 2016 04:08:20 +1200
Message-ID: <02abb433-274f-a6e8-f83c-253b5c31ed9e@gmail.com>
References: <CALxoUzuHx3Wv4=p=V2kXj+AVv=phquteCU_Et9ww02day0aADA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALxoUzuHx3Wv4=p=V2kXj+AVv=phquteCU_Et9ww02day0aADA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Savannah <kata198-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Tim,

On 09/02/2016 09:37 AM, Tim Savannah wrote:
> Hey,
> 
> There's a mistake/typo in RENAME(2) [man chapter 2, rename function]
> 
> In description it says:
> 
> "       If newpath already exists, it will be atomically replaced (subject
> to a few conditions; see ERRORS below), so that there  is  no  point  at
> which  another  process
>        attempting to access newpath will find it missing.
> "
> 
> The "see ERRORS below" should actually read "see BUGS below".
> 
> 
> The "ERRORS" lists the various values of errno for various error conditions.
> 
> The "BUGS" section actually describes the conditions being referred-to in
> the description:
> 
> """
> BUGS
>        On NFS filesystems, you can not assume that if the operation failed,
> the file was not renamed.  If the server does  the  rename  operation  and
> then  crashes,  the
>        retransmitted  RPC  which will be processed when the server is up
> again causes a failure.  The application is expected to deal with this.
> See link(2) for a similar
>        problem.
> """

I think the sentence you cite is problematic, but for different reasons 
than you suggest. The wording suggests that there are ERRORS that may
cause the operation to be nonatomic. The point is of course that there
are various restrictions on rename operations that may cause the operation 
to fail. I reworded the opening paragraphs prevent that misinterpretation:

       rename()   renames  a  file,  moving  it  between  directories  if
       required.  Any other hard links to  the  file  (as  created  using
       link(2))  are  unaffected.   Open file descriptors for oldpath are
       also unaffected.

#      Various restrictions determine whether or not the rename operation
#      succeeds: see ERRORS below.

       If newpath already exists, it will be atomically replaced (##), so that
       there is no point at which another process  attempting  to  access
       newpath will find it missing.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
