From: Nikos Mavrogiannopoulos <nmav@redhat.com>
Subject: Re: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Tue, 17 Apr 2018 15:25:30 +0200
Message-ID: <CADh2w8R_k+vAqr=KZ5M3zq_rujFfcqXCb=DBm7Jw-njw9mFesA@mail.gmail.com>
References: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
 <baa666d2-b369-c472-2bde-c3b94312341a@redhat.com> <640a98e3-ab5f-472b-adfe-db0b0ae5cfc7@gmail.com>
 <CADh2w8SLYdUqLGak6tcpeO2=nMsDGE10BMDMb4q+2Py9tHaOdw@mail.gmail.com> <6ef320c1-1c58-e5c2-f2ca-c857389b0366@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <libc-alpha-return-91580-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <6ef320c1-1c58-e5c2-f2ca-c857389b0366@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Zack Weinberg <zackw@panix.com>, Rical Jasan <rj@2c3t.io>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On Sat, Apr 14, 2018 at 9:56 PM, Florian Weimer <fweimer@redhat.com> wrote:
> On 04/14/2018 09:11 PM, Nikos Mavrogiannopoulos wrote:
>>
>>   What about the second part of the suggestion. The crypt.3 manpage
>> currently suggests including <unistd.h>, with _XOPEN_SOURCE defined,
>> and that does not work with current glibc.
>
>
> Current Fedora glibc.  We need to align the Fedora behavior with upstream
> again, either by lobbying for an upstream change, or changing Fedora back to
> how things were before.

Zack mentions reasons that crypt.h is already in use, and glibc itself
is already documenting the use of crypt.h instead of unistd.h [0].
uclibc also provides crypt.h [1]. Wouldn't that be a sufficient reason
to make the manpage document crypt.h as primary?


[0]. https://www.gnu.org/software/libc/manual/html_node/crypt.html
[1]. https://git.busybox.net/uClibc/tree/include/crypt.h
