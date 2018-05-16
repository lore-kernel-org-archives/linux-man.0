From: Florian Weimer <fweimer@redhat.com>
Subject: Re: glibc and linux-man disagrees about pkey_alloc
Date: Wed, 16 May 2018 16:36:03 +0200
Message-ID: <1f2551f3-3d6d-3905-433e-967af2c3be87@redhat.com>
References: <adae131e-c782-9508-808f-9cbea92ef694@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-92566-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <adae131e-c782-9508-808f-9cbea92ef694@arm.com>
To: Szabolcs Nagy <szabolcs.nagy@arm.com>, mtk.manpages@gmail.com
Cc: nd@arm.com, linux-man@vger.kernel.org, GNU C Library <libc-alpha@sourceware.org>, Rich Felker <dalias@libc.org>
List-Id: linux-man@vger.kernel.org

On 05/16/2018 01:10 PM, Szabolcs Nagy wrote:
> glibc sysdeps/unix/sysv/linux/bits/mman-shared.h:
> 
> int pkey_alloc (unsigned int __flags, unsigned int __access_rights) 
> __THROW;
> 
> linux-man http://man7.org/linux/man-pages/man2/pkey_alloc.2.html :
> 
> int pkey_alloc(unsigned long flags, unsigned long access_rights);
> 
> i assume the documentation should be fixed (as the glibc
> code is already in use)

unsigned long on the kernel side is unsigned long long in userspace for 
the x32 variant of x86-64, so the kernel types aren't that helpful for 
describing the user-space interface in an architecture-independent 
fashion.  I expect the flags to be consistent across architectures, so 
there can only be 32 of them anyway, and access rights currently use two 
bits on x86 (and three on POWER, I think).

Thanks,
Florian
