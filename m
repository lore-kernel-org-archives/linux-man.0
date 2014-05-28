From: Marko Myllynen <myllynen@redhat.com>
Subject: Re: [PATCH] locale.5: document glibc conventions regarding days and
 week
Date: Wed, 28 May 2014 17:56:47 +0300
Message-ID: <5385F92F.5040301@redhat.com>
References: <5382D64A.9020404@redhat.com> <CAKgNAkivXL4KwJoL9ZzEoc91zMx2sonKh=8ZV22Waa8BrWf6bQ@mail.gmail.com> <5385F087.2060602@redhat.com> <CAKgNAki4FD=2wJG+5bEqD7v7Q4ZD-2aOtRrQJEiBWKT2S2mMEA@mail.gmail.com>
Reply-To: myllynen@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-50357-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CAKgNAki4FD=2wJG+5bEqD7v7Q4ZD-2aOtRrQJEiBWKT2S2mMEA@mail.gmail.com>
To: mtk.manpages@gmail.com
Cc: Petr Baudis <pasky@ucw.cz>, GNU C Library <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>, libc-locales@sourceware.org
List-Id: linux-man@vger.kernel.org

Hi,

On 2014-05-28 17:30, Michael Kerrisk (man-pages) wrote:
> On Wed, May 28, 2014 at 4:19 PM, Marko Myllynen <myllynen@redhat.com> wrote:
>> On 2014-05-28 14:54, Michael Kerrisk (man-pages) wrote:
>>>
>>> Looking at this patch more closely, there's a piece that seems to be broken.
>>>
>>> That sentence is garbled. Some words are missing, I think. Can you clarify?
>>
>> it was clumsy indeed, and also repetitive, I don't think it's needed at all
>> as the previous paragraph already explains the same thing.
>>
>> Please see an updated and rebased patch below.
> 
> Best just to tell me what needs to be dropped from the preceding
> patch, since I've already merged and edited in a private branch.

best to drop the sentence that was garbled. I'll double check it once it
appears in a public branch.

Thanks,

-- 
Marko Myllynen
