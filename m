From: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: Man page bugs?
Date: Thu, 31 Jan 2008 14:02:02 +0100
Message-ID: <20080131130202.GT15220@kernel.dk>
References: <20080119130029.GC2466@hacking> <47A1C58D.9060101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <47A1C58D.9060101-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Jan 31 2008, Michael Kerrisk wrote:
> Hi Cong,
> 
> WANG Cong wrote:
> > Hi, Michael and list!
> > 
> > I found two problems in the man pages. The first one should
> > be a bug. It is that the type of the 2nd and 4th arguments
> > of splice(2) is wrong. The current prototype of splice(2)
> > in current man page is:
> > 
> >        long splice(int fd_in, off_t *off_in, int fd_out,
> >                    off_t *off_out, size_t len, unsigned int flags);
> > 
> > However, they should be 'loff_t' instead of 'off_t'. If we
> > use 'off_t', gcc will generate a warning. Patch is in the end
> > of this email and it's against 2.76 release. ;)
> 
> Thanks for spotting that.  Fixed as you suggest, for man-pages-2.77.
> 
> > The second one is a bit confused. The example given in tee(2)
> > even can not run normally. I got this error:
> > 
> > $ ./example bar.txt
> > tee: Invalid argument
> > 
> > I looked at tee(2), it is said that:
> > 
> > EINVAL fd_in  or  fd_out  does not refer to a pipe; or fd_in and fd_out
> >        refer to the same pipe.
> > 
> > So the first two arguments of tee(2) in the example is wrong,
> > since neither STDIN_FILENO nor STDOUT_FILENO refers to a pipe.
> > But I am not so sure, because I am new to tee(2). ;) If you can
> > comfirm this is really a bug, I can send a patch to fix this too.
> > 
> > I have checked the newest release of man pages and my kernel version
> > is 2.6.21-1.3194.fc7. Did I miss something obvious?
> 
> I'm not sure.  Perhaps Jens, the implementer of tee(2) can provide a little
> help.  Jens, what's an example of a command line for running the example
> program in the tee.2 man page?

It's not a bug, it should be run as:

$  echo hello | ./example output_file | cat

so that both stdin and stdout are pipes, as described in the man page.
The man page is correct.

-- 
Jens Axboe
