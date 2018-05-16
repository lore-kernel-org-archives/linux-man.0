From: Szabolcs Nagy <szabolcs.nagy@arm.com>
Subject: glibc and linux-man disagrees about pkey_alloc
Date: Wed, 16 May 2018 12:10:40 +0100
Message-ID: <adae131e-c782-9508-808f-9cbea92ef694@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-92552-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: mtk.manpages@gmail.com
Cc: nd@arm.com, linux-man@vger.kernel.org, GNU C Library <libc-alpha@sourceware.org>, Rich Felker <dalias@libc.org>
List-Id: linux-man@vger.kernel.org

glibc sysdeps/unix/sysv/linux/bits/mman-shared.h:

int pkey_alloc (unsigned int __flags, unsigned int __access_rights) __THROW;

linux-man http://man7.org/linux/man-pages/man2/pkey_alloc.2.html :

int pkey_alloc(unsigned long flags, unsigned long access_rights);

i assume the documentation should be fixed (as the glibc
code is already in use)
