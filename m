From: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Sat, 14 Apr 2018 21:56:53 +0200
Message-ID: <6ef320c1-1c58-e5c2-f2ca-c857389b0366@redhat.com>
References: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
 <baa666d2-b369-c472-2bde-c3b94312341a@redhat.com>
 <640a98e3-ab5f-472b-adfe-db0b0ae5cfc7@gmail.com>
 <CADh2w8SLYdUqLGak6tcpeO2=nMsDGE10BMDMb4q+2Py9tHaOdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-91556-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CADh2w8SLYdUqLGak6tcpeO2=nMsDGE10BMDMb4q+2Py9tHaOdw@mail.gmail.com>
To: Nikos Mavrogiannopoulos <nmav@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Zack Weinberg <zackw@panix.com>, Rical Jasan <rj@2c3t.io>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 04/14/2018 09:11 PM, Nikos Mavrogiannopoulos wrote:
>   What about the second part of the suggestion. The crypt.3 manpage
> currently suggests including <unistd.h>, with _XOPEN_SOURCE defined,
> and that does not work with current glibc.

Current Fedora glibc.  We need to align the Fedora behavior with 
upstream again, either by lobbying for an upstream change, or changing 
Fedora back to how things were before.

Thanks,
Florian
