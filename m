From: Paul Eggert <eggert@cs.ucla.edu>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 15:05:26 -0800
Message-ID: <5671EE36.1000402@cs.ucla.edu>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
 <mvmegen94qs.fsf@hawking.suse.de>
 <CAMe9rOr_Ydg5Nr7aV8vS0vYEFehSwFBuxrMAnCFXyyVoTF4vJQ@mail.gmail.com>
 <5671696B.3070203@gmail.com>
 <CAMe9rOqsxCEia7OWqzJ-HzZWCra5BTyYqt4japjZTw0pY=fugw@mail.gmail.com>
 <56717032.7000007@gmail.com>
 <CAKCAbMjrKfsT7P=Q=+1zWC68552aK=ciod0HYk3=HWMvkYW26w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-65723-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CAKCAbMjrKfsT7P=Q=+1zWC68552aK=ciod0HYk3=HWMvkYW26w@mail.gmail.com>
To: Zack Weinberg <zackw@panix.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, Andreas Schwab <schwab@suse.de>, libc-alpha <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>, Mike Frysinger <vapier@gentoo.org>
List-Id: linux-man@vger.kernel.org

Zack Weinberg wrote:
> When `t` is NULL, the call cannot fail.

This doesn't make it clear what happens when the time_t values roll around after 
the year 2038, on 32-bit time_t hosts. How about adding some further text along 
the following lines?

In GNU/Linux time(NULL) cannot fail with errno == EOVERFLOW, even on ABIs where 
time_t is a signed 32-bit integer and when the clock ticks past the time 2**31 
(2038-01-19 03:14:08 UTC, ignoring leap seconds). Instead, the behavior is 
undefined when the system time is out of time_t range. Applications intended to 
run after 2038 should use ABIs with time_t wider than 32 bits.
