From: Geoffrey Thomas <gthomas-uwc4OXh3ksdWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Fri, 12 Apr 2013 19:17:47 -0700
Message-ID: <alpine.DEB.2.02.1304121917230.29639@salmon-of-wisdom.skyblue-technologies.com>
References: <CAKgNAkgWiANFA1Z7o2EQmKmsMzzpa1ga2ggLeX3Bo58QmjDx6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgWiANFA1Z7o2EQmKmsMzzpa1ga2ggLeX3Bo58QmjDx6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, 14 Mar 2013, Michael Kerrisk (man-pages) wrote:

>              When O_PATH is specified in flags, flag bits other  than
>              O_DIRECTORY and O_NOFOLLOW are ignored.

We are told elsewhere in this man page that O_DIRECTORY "should not be 
used outside of the implementation of opendir(3)". Is O_PATH an exception 
to this? It seems like the implementation makes special accomodation for 
O_DIRECTORY, but opendir(3) is not going to use O_PATH.

(What's the reasoning behind the rule against O_DIRECTORY in the general 
case, anyway?)

-- 
Geoffrey Thomas
gthomas-uwc4OXh3ksdWk0Htik3J/w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
