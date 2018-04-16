From: Zack Weinberg <zackw@panix.com>
Subject: Re: [PATCH 1/2] posixoptions.7: Expand XSI Options groups.
Date: Sun, 15 Apr 2018 21:17:57 -0400
Message-ID: <CAKCAbMiaRQ83PbSABimSmcXT8oKGC9QOkE_DY0QC+C-DTB20dQ@mail.gmail.com>
References: <2d6c47e9-0f34-c828-916e-a45fbf90f837@redhat.com>
 <4d8d0ca1-a612-b3bf-563c-49d0d61856ed@2c3t.io> <CAKgNAkhXj=SFYSHQPnFxyZDB+r4n1_xdDo+=CUfZqXpqYmL4Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <libc-alpha-return-91561-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CAKgNAkhXj=SFYSHQPnFxyZDB+r4n1_xdDo+=CUfZqXpqYmL4Cg@mail.gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Rical Jasan <rj@2c3t.io>, Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Florian Weimer <fweimer@redhat.com>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

A related problem I just noticed: sysconf(3) says

| For options, typically, there is a constant
| .B _POSIX_FOO
| that may be defined in
| .IR <unistd.h> .
| If it is undefined, one should ask at run time.
| If it is defined to \-1, then the option is not supported.

But according to
<http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/unistd.h.html#tag_13_77_03_02>,
undefined is the same as defined to -1: "If a symbolic constant is not
defined or is defined with the value -1, the option is not supported
for compilation."

zw
