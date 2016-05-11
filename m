From: Szabolcs Nagy <nsz@port70.net>
Subject: Re: man-pages-4.06 released
Date: Thu, 12 May 2016 01:32:14 +0200
Message-ID: <20160511233214.GD22574@port70.net>
References: <f06548d5-5857-c73f-0f9a-331761cd748c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <libc-alpha-return-69524-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
In-Reply-To: <f06548d5-5857-c73f-0f9a-331761cd748c@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man <linux-man@vger.kernel.org>, libc-alpha <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

* Michael Kerrisk (man-pages) <mtk.manpages@gmail.com> [2016-05-11 08:51:14 +0200]:
> 
> clone.2
>     Michael Kerrisk  [Colin Ian King]
>         ERRORS: add EINVAL for improperly aligned 'child_stack' value
> 

glibc is able to align the stack
maybe it should (e.g. musl does).
