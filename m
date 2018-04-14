From: Nikos Mavrogiannopoulos <nmav@redhat.com>
Subject: Re: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Sat, 14 Apr 2018 21:11:25 +0200
Message-ID: <CADh2w8SLYdUqLGak6tcpeO2=nMsDGE10BMDMb4q+2Py9tHaOdw@mail.gmail.com>
References: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
 <baa666d2-b369-c472-2bde-c3b94312341a@redhat.com> <640a98e3-ab5f-472b-adfe-db0b0ae5cfc7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <libc-alpha-return-91555-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <640a98e3-ab5f-472b-adfe-db0b0ae5cfc7@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Florian Weimer <fweimer@redhat.com>, Zack Weinberg <zackw@panix.com>, Rical Jasan <rj@2c3t.io>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On Fri, Apr 13, 2018 at 9:24 PM, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
>
> On 04/13/2018 05:10 PM, Carlos O'Donell wrote:
> > On 04/12/2018 02:05 PM, Carlos O'Donell wrote:
> >> +.BR _XOPEN_CRPYT
> >
> > s/CRPYT/CRYPT/g
> >
> > Which I missed in the spell checker due to my overzealous use of ignore.
> >
> > Caught by Nikos Mavrogiannopoulos <nmavrogi@redhat.com> during review.
>
> Thanks. Fixed!

[re-sending in non-html]

Hi Michael,
 What about the second part of the suggestion. The crypt.3 manpage
currently suggests including <unistd.h>, with _XOPEN_SOURCE defined,
and that does not work with current glibc. Wouldn't it make sense to
switch to <crypt.h>?

regards,
Nikos
