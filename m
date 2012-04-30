From: Ted Ts'o <tytso@mit.edu>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Mon, 30 Apr 2012 07:44:10 -0400
Message-ID: <20120430114410.GB28308@thunk.org>
References: <1335669917-23970-1-git-send-email-vapier@gentoo.org>
 <CAKgNAkgykZJV59WJXW9c9gVwXhn=WNYKxo_W1GM7ocHEEFqEXg@mail.gmail.com>
 <877gwxacti.fsf@skywalker.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <877gwxacti.fsf@skywalker.in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Mike Frysinger <vapier@gentoo.org>, linux-man@vger.kernel.org, viro@zeniv.linux.org.uk, Richard Weinberger <richard@nod.at>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

It might also be a good idea to document explicitly whether or not
things like fstat() and the syscalls to manipulate extended attributes
are expected to work.

Thanks,

					- Ted
