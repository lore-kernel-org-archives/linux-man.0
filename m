From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: O_TMPFILE detection
Date: Tue, 11 Feb 2014 09:54:17 -0800
Message-ID: <CA+55aFy5qCfbr59-7X-EwoS4FpbH65tjhzMdnzSQ3AW5TsRPWw@mail.gmail.com>
References: <20140211160302.GA18936@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140211160302.GA18936@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-man@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Tue, Feb 11, 2014 at 8:03 AM, Christoph Hellwig <hch@infradead.org> wrote:
> I've started implementing support for O_TMPFILE in xfs_io in preparation
> for proper testcases and found something rather annoying:
>
> Given that we implicitly pass O_DIRECTORY as part of the full O_TMPFILE
> flag an open using O_TMPFILE will simply succeed on a kernel old enough
> to not have O_TMPFILE support, and give you a file descriptor for the
> directory passed in.  Of course this only works if you open the fd
> read-only which isn't all that useful for real temporary files, but it
> would be the natural choice for a feature test.

But O_TMPFILE without write access fails on modern kernels, so what
you test doesn't make sense.

In fact, that "O_TMPFILE fails with O_RDONLY" was done exactly so that
you could not have a program that works on kernels with O_TMPFILE
support _and_ opens a directory on old kernels without it. Basically
"O_TMPFILE | O_RDONLY" is an insane thing to do, and will never create
a temporary file.

              Linus
