From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Fri, 28 Apr 2017 16:19:28 +0200
Message-ID: <99f89c1c-86e4-2415-37d5-865a5ba81da2@redhat.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <ee5e8057-7afa-c919-8ccb-9c8e6d0833c4@redhat.com>
 <517c3e75-93b5-0762-d6a4-7a17d196654e@gmail.com>
 <3edb27c6-c9b6-df95-3810-a8b5abc740fb@redhat.com>
 <23c0ee0f-3abe-d411-b8fc-821d91b75fa7@gmail.com>
 <5093fc5e-2f99-edff-b657-5f93f978ce1e@redhat.com>
 <0409f767-3ae3-48f0-4836-8694361c755c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0409f767-3ae3-48f0-4836-8694361c755c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/20/2017 04:07 PM, Michael Kerrisk (man-pages) wrote:

> Suppose we have a version script:
> 
> [[
> VER_1 {
>      global: xyz;
>      local: *;
> };
> 
> VER_2 {
>      ...
> } VER_1;
> 
> VER_3 {
>      ...
> } VER_2;
> ]]
> 
> And we have a C file that defines xyz@VER_1, xyz@VER_2, and xyz@VER_3.
> 
> Now suppose that we want to add a VER_4 tag to the map, and a new
> function, abc(), to our C source file (so that we will end up with
> a symbol abc@VER_4).
> 
> Suppose also that in programs that link against the new library (built
> with the VER_4 map), we want the symbol xyz() to no longer be accessible
> to ld(1). There appears  to be two ways to do this:
> 
> * Don't define an xyz@VER_4 (or, of course, xyz@@VER_4) in our
>    C source file.
> * Define an xyz@VER_4.

Okay, I think I'm getting our misunderstanding now.

If xyz was previously part of the public API, then one of the versions 
xyz@VER_1, xyz@VER2, xyz@VER_3 must have been a default version, so 
probably xyz@@VER_3.

If I understand you correctly, you want to remove xyz from the API.  So 
we need to get rid of the default version.  In this case, I think most 
people just use a .symver directive with a non-default versions, in this 
example xyz@VER_3.  This overrides the version script as far as this 
particular symbol is concerned.

There is no need to introduce VER_4 for this symbol, default or not.

Does this clarify matters?

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
