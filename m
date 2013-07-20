From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Sat, 20 Jul 2013 23:07:24 +0200
Message-ID: <51EAFC0C.6060002@gmail.com>
References: <CAKgNAkgWiANFA1Z7o2EQmKmsMzzpa1ga2ggLeX3Bo58QmjDx6g@mail.gmail.com> <alpine.DEB.2.02.1304121917230.29639@salmon-of-wisdom.skyblue-technologies.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1304121917230.29639-TW+ixCjnw15HKceWYcIGBEp/09x8KikSkwxctJ+8KrKSEQKx1GYgKAC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geoffrey Thomas <gthomas-uwc4OXh3ksdWk0Htik3J/w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/13/13 04:17, Geoffrey Thomas wrote:
> On Thu, 14 Mar 2013, Michael Kerrisk (man-pages) wrote:
> 
>>              When O_PATH is specified in flags, flag bits other  than
>>              O_DIRECTORY and O_NOFOLLOW are ignored.
> 
> We are told elsewhere in this man page that O_DIRECTORY "should not be 
> used outside of the implementation of opendir(3)". Is O_PATH an exception 
> to this? It seems like the implementation makes special accomodation for 
> O_DIRECTORY, but opendir(3) is not going to use O_PATH.
>
> (What's the reasoning behind the rule against O_DIRECTORY in the general 
> case, anyway?)

That text is ancient, and I guess it was written at a time when it was
presumed that opendir(3) would/should be the only user of O_DIRECTORY.
Nowadays, I'd say the text is obsolete, among other things for the
reason that you note. I've simply removed that text. Thanks for
pointing it out.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
