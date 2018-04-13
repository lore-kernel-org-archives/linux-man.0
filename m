From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Fri, 13 Apr 2018 11:34:46 +0200
Message-ID: <adb4d22e-f0b9-584d-5a61-c4290038b03b@gmail.com>
References: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-91532-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Cc: mtk.manpages@gmail.com, Florian Weimer <fweimer@redhat.com>, Zack Weinberg <zackw@panix.com>, Rical Jasan <rj@2c3t.io>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 04/12/2018 09:05 PM, Carlos O'Donell wrote:
> The distribution may choose not to support _XOPEN_CRYPT in the
> case that the distribution has transitioned from glibc crypt to
> libxcrypt.
> 
> Signed-off-by: Carlos O'Donell <carlos@redhat.com>

Thanks, Carlos. I applied the patch, but rather than having the
exact same text in both pages, I simply added a cross reference 
in encrypt(3).

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
