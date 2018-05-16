From: Rich Felker <dalias@libc.org>
Subject: Re: glibc and linux-man disagrees about pkey_alloc
Date: Wed, 16 May 2018 11:18:44 -0400
Message-ID: <20180516151844.GX1392@brightrain.aerifal.cx>
References: <adae131e-c782-9508-808f-9cbea92ef694@arm.com>
 <1f2551f3-3d6d-3905-433e-967af2c3be87@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <libc-alpha-return-92567-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
In-Reply-To: <1f2551f3-3d6d-3905-433e-967af2c3be87@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>, mtk.manpages@gmail.com, nd@arm.com, linux-man@vger.kernel.org, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On Wed, May 16, 2018 at 04:36:03PM +0200, Florian Weimer wrote:
> On 05/16/2018 01:10 PM, Szabolcs Nagy wrote:
> >glibc sysdeps/unix/sysv/linux/bits/mman-shared.h:
> >
> >int pkey_alloc (unsigned int __flags, unsigned int
> >__access_rights) __THROW;
> >
> >linux-man http://man7.org/linux/man-pages/man2/pkey_alloc.2.html :
> >
> >int pkey_alloc(unsigned long flags, unsigned long access_rights);
> >
> >i assume the documentation should be fixed (as the glibc
> >code is already in use)
> 
> unsigned long on the kernel side is unsigned long long in userspace
> for the x32 variant of x86-64, so the kernel types aren't that
> helpful for describing the user-space interface in an
> architecture-independent fashion.  I expect the flags to be
> consistent across architectures, so there can only be 32 of them
> anyway, and access rights currently use two bits on x86 (and three
> on POWER, I think).

There's possibly some argument to be made that by the time 32 bits are
filled, 32-bit archs will be legacy-only and won't be getting new pkey
hardware features, in which case having the full 64 bits available
would be nice... But I don't really care what decision is made as long
as it's consistent.

Rich
