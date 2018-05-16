From: Szabolcs Nagy <szabolcs.nagy@arm.com>
Subject: Re: glibc and linux-man disagrees about pkey_alloc
Date: Wed, 16 May 2018 12:33:37 +0100
Message-ID: <c3d942a9-ebb7-492f-7c73-af713aed9ac7@arm.com>
References: <adae131e-c782-9508-808f-9cbea92ef694@arm.com>
 <20180516111910.GB19883@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-92554-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <20180516111910.GB19883@altlinux.org>
To: mtk.manpages@gmail.com, linux-man@vger.kernel.org, GNU C Library <libc-alpha@sourceware.org>, Rich Felker <dalias@libc.org>
Cc: nd@arm.com
List-Id: linux-man@vger.kernel.org

On 16/05/18 12:19, Dmitry V. Levin wrote:
> On Wed, May 16, 2018 at 12:10:40PM +0100, Szabolcs Nagy wrote:
>> glibc sysdeps/unix/sysv/linux/bits/mman-shared.h:
>>
>> int pkey_alloc (unsigned int __flags, unsigned int __access_rights) __THROW;
>>
>> linux-man http://man7.org/linux/man-pages/man2/pkey_alloc.2.html :
>>
>> int pkey_alloc(unsigned long flags, unsigned long access_rights);
>>
>> i assume the documentation should be fixed (as the glibc
>> code is already in use)
> 
> Note that pkey_alloc syscall takes arguments of type "unsigned long"
> and explicitly tests them for unsupported bits.
> 
> 

i see, but this is a general bug in the way the syscalls are
documented: a syscall is not a c function, so a c declaration
is not the right way to document it (the pcs does not even
work for syscalls and the linux uapi headers do not provide
magic inline wrappers usable from freestanding c code).

the libc api is in c so that is reasonable to document using
the c language (using c/posix types).

so i recommend making the distinction between kernel uapi,
syscall abi and libc api clear when they disagree about types.

in this case the man says '#include <sys/mman.h>' which is
a libc header, so the declaration has to match whatever is
in there otherwise it's misleading.
