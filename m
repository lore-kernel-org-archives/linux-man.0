From: Christoph Hellwig <hch@infradead.org>
Subject: O_TMPFILE detection
Date: Tue, 11 Feb 2014 08:03:02 -0800
Message-ID: <20140211160302.GA18936@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

I've started implementing support for O_TMPFILE in xfs_io in preparation
for proper testcases and found something rather annoying:

Given that we implicitly pass O_DIRECTORY as part of the full O_TMPFILE
flag an open using O_TMPFILE will simply succeed on a kernel old enough
to not have O_TMPFILE support, and give you a file descriptor for the
directory passed in.  Of course this only works if you open the fd
read-only which isn't all that useful for real temporary files, but it
would be the natural choice for a feature test.

I guess we can't really fix this up any more, but does anyone have a
good idea how to document this properly in the man page?
