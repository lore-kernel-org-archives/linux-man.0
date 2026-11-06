Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002564;
	b=lF5TpMbxMss/aWcakUPbixWjU6TNbXqy0VmsOQH9KPTGQNhATP2qQax6BLTKQogSZU4/
	 JptY08WposlSH3/RRTIbjOoz+ti3Vc4f1USY39WEQumstFWlOiI/Pu/prbZ7jt5VOoXyn
	 5PspThf21bU+ZC7hUQK9apcpVr683TeNpMLz6LB1mM4qHdk9Jc081JJxBtX2yfNy4dYpn
	 RpDQE03+HuBQUz8gmeQ8RuHnm+WSjgQPTFgZ+LOZ6vEfcOkYsRDafpQwtS1RvYQlkPJOL
	 2mTFK8xwj6KyvIiN6wL7a9KvDvwVg1LD3XIYdqhH9EhQF3wug3FYUy/Sw5OvE6aw6hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=3PbhyiPabOpmTXdBhRj8XCubCOmz7s9QpQuDlNWnq6A=;
	b=d2vNNGpU57zLRWLh5E5XScCnfvFSxYM5dSCMDOY+7fqPH91JPVND3F6OfWPUOtcHtClB
	 jUiTjA2DpqfxOwJxjFIlkATpljUvK1A0MRU9ZPJIlqtCqrRMDE4C/5CePdy99oyRSVY7T
	 ixo0Xro6gJ8mPTe8hTAyQPfnPsbnw8vLY/jAypMO7ty3vrx9BhXe2HvCrbqyLFPeXBiNJ
	 3JrTfdK7hSIMU/pfyFopf1JPr9ia0M2zcA4yw0hB+HrrBS/Ta64pggOlwahRL3xCGjJ5y
	 uboEKWqNTzF+8pNvCZGVjO0GwFwWyy6OrB9LWBe374AMZePVvp2eArApPcsfFFp6EWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuCisb2J;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC85E606A326
	for <linux-man@vger.kernel.org>; Fri,  6 Nov 2026 22:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC85E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuCisb2J
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so844885e9.0
        for <linux-man@vger.kernel.org>; Fri, 06 Nov 2026 14:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794002562; x=1794607362; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PbhyiPabOpmTXdBhRj8XCubCOmz7s9QpQuDlNWnq6A=;
        b=uuCisb2JGC+TiPoVkmEvcivGcE/u7rJpsKa1UalTpROEPuFiZH084S7LnG/ZBWNMxa
         Jlzxqt+/MmHWcgiO8I0o8G2oKU/EHeVC7Pl/w97hn7E/NiWCkvc26ZjjGedKDzySAe0q
         WcsieDcD04jRhveVdR/QySwUtA08DH+SOjan/FPjJJUs3PBkjqQVvMaP9t71GEGgsk/d
         7vp2VRGjfmtfUWa1/JWLztKB14BtgQpmHDM8f6q+UcjxHtfIGjDQBTcrJwBQRZ50bkvd
         8L7SHk7/NGyu38edxt/olVzB3W27/41zLu0oCB8a3C9eeuM7oBAy6NWjOGvjVCEsR++Q
         XvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002562; x=1794607362;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3PbhyiPabOpmTXdBhRj8XCubCOmz7s9QpQuDlNWnq6A=;
        b=h+PH2oR8LoAB4oUeUsUvSH1HwsuF8hgV5/61DCjYdclzBnJcEYUdSVihVc+C844PzI
         752Cg6Rl0Bf4yCC6EEqlcTGaXHDVy505B0oYDa7LPb7dK52IL3hrFbSeBj3t4ECwKHKt
         5DzeaWBwswQ0GlU8kqx6pMQsiMoBJFwC2IeSnPZfH/4qIe0C2j6ztbv505zoekc3BqQk
         gWZtzH0ubSkbDBE4bxYzzhaWpQqAvgPB2xnsJ7injZm6M2RdHOGlXIujvyaKxzYn+3sm
         4eCgmdGYqUZd090yeqBw4/AXjuYgG5Yr7L7xqoYsU+Camt945VhGbznEV5pr3B0/zucs
         e/1w==
X-Forwarded-Encrypted: i=1; AKwUvByrBa2RfPC0iJPbcsCer8nmmgGbRRMILnYmiS/uaLP1Y4UNygVcfkJJqPjbutjAR6ovFwSg72FQa+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fv8qvuFXF5Egu3Hx3356a6NL/JYChzTJ9jq1YGi4skey66V5Q
	Gjtoyzf8asJoWPjlqQDf5l1Koznyqat8aLQi0rKD4wumd9TX3748tKte
X-Gm-Gg: AYBFou0N1/T8NizVm1Gnkv6uEGUoop2jknWVPFgyCFshoZ3JsUpEU32RJQA78FmVOmP
	4hNyByFM9KSVXBuS2axEkI/CwZuRQ9Eg1XFGKbGXdwhLW2wC2XtAazTewDozUzZlzYuMcf+RHtD
	/sk1m8SuZgDrgjOd2+HIoMFi0VisMQrqRQB85r1pMlolHoOu+OKI+H/QVlxiNLLzHFRXZrxzLze
	l4mn0KmHnkp5duDUkaE5dcH+DSg1e+fISjHGMV4MM2HR+BqVZOXicniI0iqWLS1Wmkm3YRrpXE8
	3HQDh+rpH/KQiVouV/gCwrvxmAS5RPmQgHL1P3LCBoEr5412qDARpl/IVKJZj5HmePzbCIh1GDh
	PgXv+y0HIbdJu9uBuZSBQAVYGiidSYKzSKNIgN5htmdu1DlFjp/9ttam36rfMUQ+EZjc9F51vm4
	qrefPLfXKz6Xz+ExXgj0wICXbTDKjozrdz+21Wn+YgcECCT4B5LYUjbRugB4hjcIK0Vk1tgtNbN
	SFUGVr3zvSPAXaBvvCal1ersSmDCqsupjtGkmZObNrOl9BRqcFJIRDSyP5EMN1GTMweZgwcktB1
	yYeFJQCBPtI2OcEcvbg+TKDWfZ09cAqpOFhCdBJrXK+k9j+YhlIj
X-Received: by 2002:a05:600c:3487:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4b8190f41a5mr5301075e9.5.1794002562037;
        Fri, 06 Nov 2026 14:02:42 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3283b50sm11041715e9.10.2026.11.06.14.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:41 -0800 (PST)
Date: Fri, 6 Nov 2026 23:02:40 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: Alejandro Colomar <alx@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
Message-ID: <20261106.73089117d0af@gnoack.org>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102233932.29912-2-matthieu@buffet.re>

On Tue, Nov 03, 2026 at 12:39:32AM +0100, Matthieu Buffet wrote:
> Landlock support for UDP-specific policy was merged in 7.2 in
> linux.git 9a8ed15ce224 ("landlock: Add UDP bind() access control")
> and
> linux.git e61247a2e694 ("landlock: Add UDP send+connect access control")
> 
> Add documentation for new access rights taken from the UAPI header, plus:
> - clarify the description of the most non-trivial behavior (auto-bind
>   denials when emitting, which can occur even if CONNECT_SEND_UDP is not
>   handled)
> - improve AF_UNSPEC behavior description in both connect() and IPv6-send
>   cases
> - minor wording fixes to be backported in the UAPI header
> 
> Link: <https://github.com/landlock-lsm/linux/issues/66>
> Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
> ---
>  man/man2/landlock_add_rule.2 | 14 +++++--
>  man/man7/landlock.7          | 74 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 82 insertions(+), 6 deletions(-)
> 
> diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> index 253498bfa2cf..337ff4150f2c 100644
> --- a/man/man2/landlock_add_rule.2
> +++ b/man/man2/landlock_add_rule.2
> @@ -82,7 +82,7 @@ just a file.
>  .TP
>  .BR LANDLOCK_RULE_NET_PORT "  (since Landlock ABI version 4)"
>  For these rules,
> -the object is a TCP port,
> +the object is a TCP or UDP port,
>  and the related actions are defined with
>  .IR "network access rights" .
>  .IP
> @@ -120,8 +120,13 @@ with
>  A Landlock rule with port 0
>  and the
>  .B LANDLOCK_ACCESS_NET_BIND_TCP
> -right means that requesting to bind on port 0 is allowed
> -and it will automatically translate to binding on the related port range.
> +or
> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> +right means that requesting to bind on port 0
> +(explicitly, or implicitly
> +for instance by sending a datagram on an unbound UDP socket)
> +is allowed
> +and it will automatically translate to binding on a kernel-assigned ephemeral port.

With the caveat of not being a native speaker either, the commas in
this sentence feel wrong to me.

Suggestion:

  A Landlock rule with port 0 and the LANDLOCK_ACCESS_NET_BIND_TCP or

  LANDLOCK_ACCESS_NET_BIND_UDP right means that requesting to bind to
                                                                   ^^
  port 0 (explicitly or implicitly, for instance, by sending a datagram
                   ^^^           ^^^           ^^^
  on an unbound socket) is allowed, and it will automatically
                                 ^^^
  translate to binding on a kernel-assigned ephemeral port.


(You might also use the shorter "e.g.," instead of "for instance,".)
I'm happy to stand corrected, Alejandro has a better grip on correct
grammar than me. :)


>  .P
>  .I flags
>  is a bit mask of the following optional flags:
> @@ -181,7 +186,8 @@ can fail for the following reasons:
>  .I rule_type
>  is
>  .BR LANDLOCK_RULE_NET_PORT ,
> -but TCP is not supported by the running kernel.
> +but the kernel was built without
> +.BR CONFIG_INET .
>  .TP
>  .B EBADF
>  .I ruleset_fd
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index ad63826da84f..296c4d74a22f 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -53,8 +53,8 @@ For these rules, the object is a file hierarchy,
>  and the related filesystem actions are defined with
>  .IR "filesystem access rights" .
>  .TP
> -.BR "Network rules" " (since ABI v4)"
> -For these rules, the object is a TCP port,
> +.BR "Network rules" " (since ABI v4 for TCP, v10 for UDP)"
> +For these rules, the object is a TCP or UDP port,
>  and the related actions are defined with
>  .IR "network access rights" .
>  .\"
> @@ -276,6 +276,74 @@ Bind a TCP socket to a local port.
>  .TP
>  .BR LANDLOCK_ACCESS_NET_CONNECT_TCP "  (since Landlock ABI version 4)"
>  Connect an active TCP socket to a remote port.
> +.P
> +And similarly for UDP port numbers:
> +.TP
> +.BR LANDLOCK_ACCESS_NET_BIND_UDP "  (since Landlock ABI version 10)"
> +Bind UDP sockets to the given local port.
> +.TP
> +.BR LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP "  (since Landlock ABI version 10)"
> +Set the remote port of UDP sockets to the given port,
> +or send datagrams to the given remote port
> +ignoring any destination pre-set on a socket.
> +.P
> +Note on auto-binding:
> +Setting a remote address
> +or sending a first datagram
> +auto-binds
> +UDP sockets
> +to an ephemeral local source port
> +if not already bound.
> +To allow this if
> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> +is handled
> +(even if
> +.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
> +is not),

This phrasing is different to the kernel documentation, where it says:

   To allow this if both LANDLOCK_ACCESS_NET_BIND_UDP and
   LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP are handled, [...]

   (see https://docs.kernel.org/userspace-api/landlock.html)

Is this intentional?

> +either:
> +.IP \[bu] 3
> +use a socket already bound to a port
> +before the ruleset started being enforced;
> +.IP \[bu] 3
> +grant
> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> +on port 0, meaning
> +\[lq]any port in the ephemeral port range\[rq];
> +.IP \[bu] 3
> +grant
> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> +on a specific port,
> +and call
> +.BR bind (2)
> +on that port before trying to
> +.BR connect (2)
> +or send datagrams.


> +.P
> +Note on
> +.BR AF_UNSPEC :
> +Calling
> +.BR connect (2)
> +on a TCP or UDP socket
> +with an address of the
> +.B AF_UNSPEC
> +family
> +can only dissolve existing associations,
> +and as such is always allowed.
> +On IPv6 UDP sockets, if
> +.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
> +is handled,
> +sending datagrams to
> +.B AF_UNSPEC
> +addresses is not supported
> +and will always result in a denial,
> +as if the policy rejected it:
> +use a
> +.I NULL
> +address instead to get the same semantics
> +inside and outside a Landlock domain.
> +Other uses of the
> +.B AF_UNSPEC
> +family have unchanged semantics.

This second "note" discussion seems to deviate in its meaning from
what the second "note" box said in the kernel documentation.

https://docs.kernel.org/userspace-api/landlock.html#network-flags

Is this intentional?

I admittedly have trouble following the documentation in this
rewritten note (and also the kernel documentation).  What does
"sending datagrams to AF_UNSPEC" mean in the context of IPv6?  The
connect(2) to AF_UNSPEC is a different matter - that one does not set
up a default remote address as other UDP connects go, but it dissolves
a pre-existing TCP connection, or in the UDP case, it likely removes
the remote address that was configured with a previous connect(2)
call with an actual address.

>  .\"
>  .SS Scope flags
>  These flags enable isolating a sandboxed process from a set of IPC actions.
> @@ -531,6 +599,8 @@ _	_	_
>  9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
>  _	_	_
>  10	7.2	LANDLOCK_ADD_RULE_QUIET
> +\^	\^	LANDLOCK_ACCESS_NET_BIND_UDP
> +\^	\^	LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
>  .TE
>  .P
>  Users should use the Landlock ABI version rather than the kernel version
> -- 
> 2.47.3
> 

Is the new man page phrasing one that you'd also like to carry over
into the kernel documentation?

–Günther

