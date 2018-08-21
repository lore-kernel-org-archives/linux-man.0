From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Are ut_user and ut_host in struct utmp NUL-terminated?
Date: Tue, 21 Aug 2018 10:47:46 +0200
Message-ID: <48dafca1-ea0f-c721-c95a-6c772c761305@gmail.com>
References: <11742781-3872-5bbf-55d6-8ce597f21e53@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-95417-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <11742781-3872-5bbf-55d6-8ce597f21e53@redhat.com>
To: Florian Weimer <fweimer@redhat.com>, GNU C Library <libc-alpha@sourceware.org>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Cc: mtk.manpages@gmail.com
List-Id: linux-man@vger.kernel.org

On 08/13/2018 02:10 PM, Florian Weimer wrote:
> Can ut_user be exactly UT_NAMESIZE bytes long?  Or is it necessary to 
> set aside a byte with the NUL terminator?
> 
> I'm not sure what POSIX says about struct utmpx.  It never says “string” 
> in the context of ut_user, so I don't think it clarifies this matter.

Each of the char fields in utmp/utmpx can be completely filled with
characters. (I.e., there may not be a terminating null byte.)
As you note, POSIX does not say much here, but perhaps the fact that
the term "string" is not mentioned is a clue.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
