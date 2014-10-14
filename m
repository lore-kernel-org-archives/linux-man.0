From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: readlink.2 query
Date: Tue, 14 Oct 2014 12:25:39 +0100
Message-ID: <CAGc9EvcVd1UsqAfrztzR=0+oeQhbP0A9tEYLXnNKSdRf-nwSxA@mail.gmail.com>
References: <CAGc9Evenz+moY7M_EYuj7JFKCQJcgMCkWdV10wRucE0GiEY_dw@mail.gmail.com>
	<CAKgNAkjjBAKNMbJtyK2UYuSMKWKycz_k8tfCXvijO6H_BsVvrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjjBAKNMbJtyK2UYuSMKWKycz_k8tfCXvijO6H_BsVvrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael

On 10 October 2014 21:26, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Jonny
>
> On Thu, Oct 9, 2014 at 1:22 PM, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
>> Hello
>> Just looking at readlink.2 I have a query
>>
>> http://man7.org/linux/man-pages/man2/readlink.2.html
>>
>> r = readlink(argv[1], linkname, sb.st_size + 1);
>>
>> Would this example be better without +1 ? We need to save that byte
>> for nul terminator.
>
> No -- it;s needed to detect the case
>
>     if (r > sb.st_size) {

Ok, I understand now. It lets you catch that the size of the link has
increased, by that 1 byte overrun (that we didn't expect)

I guess could even just check against st_size:

if (r != sb.st_size)
{
        fprintf(stderr, "symlink changed size "
                               "between lstat() and readlink()\n");
               exit(EXIT_FAILURE);
}

Regards, Jonny
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
