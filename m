From: Carlos O'Donell <carlos@redhat.com>
Subject: Re: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Fri, 13 Apr 2018 10:10:53 -0500
Message-ID: <baa666d2-b369-c472-2bde-c3b94312341a@redhat.com>
References: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-91541-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
To: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Florian Weimer <fweimer@redhat.com>, Zack Weinberg <zackw@panix.com>, Rical Jasan <rj@2c3t.io>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 04/12/2018 02:05 PM, Carlos O'Donell wrote:
> +.BR _XOPEN_CRPYT

s/CRPYT/CRYPT/g

Which I missed in the spell checker due to my overzealous use of ignore.

Caught by Nikos Mavrogiannopoulos <nmavrogi@redhat.com> during review.

> +is not available and include crypt.h for the function prototypes; otherwise
> +libxcrypt is a ABI compatible drop-in replacement.

-- 
Cheers,
Carlos.
