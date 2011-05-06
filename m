From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: missing error from bind.2
Date: Fri, 6 May 2011 10:35:42 +0300
Message-ID: <BANLkTi=ib1f1-Q-6ZwEQF=GZ7XoFV40-fw@mail.gmail.com>
References: <775f04010802060518l11dbc1d6t2aa7e8b0b5a97904@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <775f04010802060518l11dbc1d6t2aa7e8b0b5a97904-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

(Michael, I sent you this a while ago and didn't get any reply, so I
thought maybe it got lost somehow, that's why I'm resending it to the
linux-man list)

 I just stumbled upon bind() returning -1 with errno set to ENODEV and
 noticed that this value for errno is not documented in bind.2. I was
 trying to bind to an IPv6 address.

 I just checked the kernel code we are using, and then the one in
 2.6.23 and noticed this in inet6_bind():

 #
 # if (addr_type & IPV6_ADDR_LINKLOCAL) {
 # if (addr_len >= sizeof(struct sockaddr_in6) &&
 # addr->sin6_scope_id) {
 # /* Override any existing binding, if another one
 # * is supplied by user.
 # */
 # sk->sk_bound_dev_if = addr->sin6_scope_id;
 # }
 #
 # /* Binding to link-local address requires an interface */
 # if (!sk->sk_bound_dev_if) {
 # err = -EINVAL;
 # goto out;
 # }
 # dev = dev_get_by_index(sk->sk_bound_dev_if);
 # if (!dev) {
 # err = -ENODEV;
 # goto out;
 # }
 # }

 Notice the err = -ENODEV because the value set in sin6_scope_id isn't
 something we expect. We are indeed setting that in our code, and using
 a link-local address. Now, 'man ipv6' says:

       sin6_scope_id is an ID  of  depending  of  on  the
       scope  of  the address.  It is new in Linux 2.4.  Linux only
 supports it for
       link scope addresses, in that  case  sin6_scope_id  contains
 the  interface
       index (see netdevice(7))

 So ENODEV is returned for IPv6 when using a link-local address and a
 sin6_scope_id that doesn't include a valid interface index. The
manual page already has a section with errors specific to domain
sockets, I guess a new section with IPv6 specific errors would be
good.

 Stefan.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
