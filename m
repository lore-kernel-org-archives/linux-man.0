From: Zack Weinberg <zackw@panix.com>
Subject: Re: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Sun, 15 Apr 2018 21:35:19 -0400
Message-ID: <CAKCAbMinGS4rOe_jAF-x9izNtWenYCCYxkv8dtXavUfsygJvwA@mail.gmail.com>
References: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
 <baa666d2-b369-c472-2bde-c3b94312341a@redhat.com> <640a98e3-ab5f-472b-adfe-db0b0ae5cfc7@gmail.com>
 <CADh2w8SLYdUqLGak6tcpeO2=nMsDGE10BMDMb4q+2Py9tHaOdw@mail.gmail.com> <6ef320c1-1c58-e5c2-f2ca-c857389b0366@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <libc-alpha-return-91562-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <6ef320c1-1c58-e5c2-f2ca-c857389b0366@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: Nikos Mavrogiannopoulos <nmav@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Rical Jasan <rj@2c3t.io>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On Sat, Apr 14, 2018 at 3:56 PM, Florian Weimer <fweimer@redhat.com> wrote:
> On 04/14/2018 09:11 PM, Nikos Mavrogiannopoulos wrote:
>>
>>   What about the second part of the suggestion. The crypt.3 manpage
>> currently suggests including <unistd.h>, with _XOPEN_SOURCE defined,
>> and that does not work with current glibc.
>
> Current Fedora glibc.  We need to align the Fedora behavior with upstream
> again, either by lobbying for an upstream change, or changing Fedora back to
> how things were before.

Portable code has always needed to cope with the possibility of
crypt() not being declared by unistd.h -- that goes all the way back
to the old export control policy in the 1990s.  This is what I wrote
for the new crypt(3) manpage shipped with libxcrypt:

SYNOPSIS
       #include <crypt.h>

       char *crypt(const char *phrase, const char *setting);
       char *crypt_r(const char *phrase, const char *setting, struct
               crypt_data *data);
       char *crypt_rn(const char *phrase, const char *setting, void *data, int
               size);
       char *crypt_ra(const char *phrase, const char *setting, void **data,
               int *size);

       Link with -lcrypt.

[...]
PORTABILITY NOTES
       crypt is included in POSIX, but crypt_r, crypt_rn, and crypt_ra are not
       part of any standard.
[...]
       Due to historical restrictions on the export of cryptographic  software
       from  the  USA,  crypt  is  an  optional POSIX component.  Applications
       should therefore be prepared for crypt  not  to  be  available,  or  to
       always fail (setting errno to ENOSYS) at runtime.

       POSIX  specifies  that  crypt  is declared in unistd.h, but only if the
       macro _XOPEN_CRYPT is defined and has a value greater than or equal  to
       zero.   Since  libcrypt  does  not provide unistd.h, it declares crypt,
       crypt_r, crypt_rn, and crypt_ra in crypt.h instead.

I think this would be a good tack to take in the Linux manpages'
crypt(3) as well, minus explicit mentions of lib(x)crypt.

Incidentally, libxcrypt doesn't prototype encrypt or setkey in public
headers, nor does it allow new programs to link against them. Please
consider dropping encrypt(3) or at least declaring it to be obsolete
at the top of the manpage. Nobody should be using single DES for
anything anymore.

I'm a little surprised to hear Fedora has taken the plunge on
switching to libxcrypt.  I did put in a whole lot of work last year on
making it an ABI-compatible replacement, but I still have a long list
of things that need changing before I consider it *done*, and I
believe so does Bjoern.  But I do look forward to the bug reports from
more extensive testing :-)

I'll send a patch shortly that adds a --disable-libcrypt configure
switch to glibc, hopefully that can work for Fedora and you don't have
to be carrying patches around.

zw
