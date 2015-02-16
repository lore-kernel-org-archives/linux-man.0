From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Error in ldconfig(8)
Date: Mon, 16 Feb 2015 07:05:30 +0100
Message-ID: <54E188AA.2010800@gmail.com>
References: <CAMDSSyBWHyD2Kzep0tUtoga1n090s92DL1BtLg8HreGRPGm8bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMDSSyBWHyD2Kzep0tUtoga1n090s92DL1BtLg8HreGRPGm8bQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Horgan <phorgan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Patrick,

On 02/15/2015 07:19 PM, Patrick Horgan wrote:
> Confirmed against latest online man page. Seen on Fedora fc22 and using
> ldconfig (GNU libc) 2.20
> 
> I noticed in the bottom of the man page it says that /etc/ld.so.conf is a
> "File containing a list of colon, space, tab, new-line, or comma-separated
> directories in which to search for libraries."
> 
> ldconfig expects directories to be one per line so only the new-line
> separator is right.
> 
> If for example ld.so.conf had a line containing
> 
> /usr/local/lib:/usr/local/lib64
> 
> Then sudo ldconfig -v would output a line
> 
> ldconfig: Can't stat /usr/local/lib:/usr/local/lib64: No such file or
> directory
> 
> Putting the same directories on separate lines works fine.
> 
> The -v argument to ldconfig is needed because otherwise ldconfig fails
> silently. Comma, space, and tab separators all fail analogously.

Yes, I confirmed this also from checking the glibc source.
And that text is no more true now that when it first appeared
when the man page was added 14 years ago. I've removed mention of
delimiters other than newlines.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
