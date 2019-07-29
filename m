From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] pldd.1: Document glibc's unbreakage of tool.
Date: Mon, 29 Jul 2019 21:07:44 +0200
Message-ID: <1906e1af-961c-adee-b08a-7daf8663b56d@gmail.com>
References: <20190511072049.2w7pp723iszp3gra@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-104022-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <20190511072049.2w7pp723iszp3gra@localhost.localdomain>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, libc-alpha@sourceware.org
List-Id: linux-man@vger.kernel.org

Hi Branden,

On 5/11/19 9:20 AM, G. Branden Robinson wrote:
> ...plus a patch with some suggested wording fixes.
> 
> ...plus a patch with some suggestions on improving the formatting and
> markup.

Sorry for the late reply. I actually applied some of your
changes a few days back (they're already in Git).

You often have good inputs, but your idiosyncratic submission
style does make it harder than necessary for me to deal with
that input. Please:

* One patch per mail
* Patches best inline; if you are worried your mailer may
  break the patch, then both inline and as an attachment.
* Your patch 3 does so many things at the same time that it's
  impossible to apply. Some of the things I agree with. Others
  not. 
* Some of your points in patch 3 are really suggestions
  suggestions for global changes in the manual pages.
  Obviously, they would need discussion, and shouldn't
  be done piecemeal, page at a time. I made some of the
  uncontroversial changes from this patch manually.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
