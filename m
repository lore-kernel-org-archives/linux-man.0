From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch] Fix groff syntax
Date: Sun, 26 Sep 2010 18:00:39 +0200
Message-ID: <AANLkTik3+Wx3-dOnPmeCZoz_RLRjGSXbWRo=cW7vKR7k@mail.gmail.com>
References: <AANLkTinn0cN2w2+u0LuZWQcWZgCdEN6w=q3jq9zzLUr6@mail.gmail.com>
	<AANLkTi=_UY9By=Vf8Jv_M4BK8M6ED318j9rhiYkVT5Sk@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=_UY9By=Vf8Jv_M4BK8M6ED318j9rhiYkVT5Sk-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2010/9/26 Michael Kerrisk wrote:
> On Sun, Sep 26, 2010 at 12:09 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello,
>>
>> Here is a syntax.patch file to fix 2 groff issues, and another patch
>> to fix trivial issues with mknotat.2 and rand.3.
>
> Thanks Denis. All changes applied for 3.28.
>
> So, a question. How close is the Debian French translation behind me?
> It looks like: very close. (Are there any still untranslated pages?)

Hello Michael,

We are indeed very close ;)
  3.24 man-pages (26-Feb-2010) man-pages-fr (28-Feb-2010)
  3.25 man-pages (20-Jun-2010) man-pages-fr (11-Jul-2010)
  3.26 man-pages (05-Sep-2010) man-pages-fr (13-Sep-2010)
All pages are translated except mdoc.samples.7, this page is huge and
not really useful IMHO.

We follow closely your git repository to translate HEAD, so that we
have only a small amount of work left when you release.  (Except when
you don't push for a couple of weeks and send dozens of large commits
in a row ;))

> If so, that's great, since it's good to to know I have sort of
> checking that you are doing with these packages.

Right, and when you can, please push your changes as soon as possible,
we may catch those mistakes before you release.  But it is up to you,
really, we are happy with your current workflow, it does not matter
much if our release is delayed by 2 days instead of 2 weeks.

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
