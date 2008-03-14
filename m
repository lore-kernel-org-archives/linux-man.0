From: "Stefan Puiu" <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: missing error value from bind.2
Date: Fri, 14 Mar 2008 08:40:41 +0200
Message-ID: <775f04010803132340x3be1f3a3naa86097d62115909@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_14393_22224770.1205476842068"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

------=_Part_14393_22224770.1205476842068
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

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
sin6_scope_id that doesn't include a valid interface index. Not sure
if this needs to go in bind.2 or in ipv6.7 - I guess you would know
better.

I've attached a suggested patch.

------=_Part_14393_22224770.1205476842068
Content-Type: application/octet-stream; name=bind.2.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fdsdr01u0
Content-Disposition: attachment; filename=bind.2.patch

LS0tIC9kL1ZNV2FyZS9TaGFyZWQvbWFucGFnZXMvbWFuLXBhZ2VzLTIuNzkvbWFuMi9iaW5kLjIu
b3JpZwkyMDA4LTAzLTEzIDE5OjE3OjUwLjc2MjM3NTAwMCArMDIwMAorKysgL2QvVk1XYXJlL1No
YXJlZC9tYW5wYWdlcy9tYW4tcGFnZXMtMi43OS9tYW4yL2JpbmQuMgkyMDA4LTAzLTEzIDE5OjI2
OjAzLjEzNzM3NTAwMCArMDIwMApAQCAtMjE3LDYgKzIxNywxOCBAQAogLlRQCiAuQiBFUk9GUwog
VGhlIHNvY2tldCBpbm9kZSB3b3VsZCByZXNpZGUgb24gYSByZWFkLW9ubHkgZmlsZSBzeXN0ZW0u
CisuUFAKK1RoZSBmb2xsb3dpbmcgZXJyb3JzIGFyZSBzcGVjaWZpYyB0byBJUHY2CisuUkIgKCBB
Rl9JTkVUNiApCitzb2NrZXRzOgorLlRQCisuQiBFTk9ERVYKKy5JIGFkZHIKK2lzIGEgbGluay1s
b2NhbCBJUHY2IGFkZHJlc3MsIGFuZCB0aGUgc2luNl9zY29wZV9pZCBpbiBpdCB3YXMgc2V0IHRv
CithbiBpbnZhbGlkIGludGVyZmFjZSBpbmRleCAoU2VlIGFsc28KKy5CUiBpcHY2KDcpCisgYW5k
IAorLkJSIG5ldGRldmljZSAoNykuKQogLlNIICJDT05GT1JNSU5HIFRPIgogU1ZyNCwgNC40QlNE
LCBQT1NJWC4xLTIwMDEKIC5SQiAoIGJpbmQgKCkK
------=_Part_14393_22224770.1205476842068--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
