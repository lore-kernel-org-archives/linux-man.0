Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448544746A5
	for <linux-man@vger.kernel.org>; Sat, 26 Sep 2026 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431341; cv=none; b=hYuaVAcP41RkPt7gRh0AegTvVL+04rqkqGT20ijPAYfbBfAUNU3KDJbnwb990gpBHeHPdQJprk7PCRF9vMRGZQ+96sOCf5O3TWqApgJ/ySI1Hny4IGwwmhJpUzA6C9rF5WbFA7kJCIoI4DWMCLEuRNU/9YVMC2Up+8Y6j/0uHs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431341; c=relaxed/simple;
	bh=NYHB7+t4bVQrUa9YHM57xQ0Ozm+TlgiYWZc+BCDkhlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtPFW0v+24A3O1F8O9aODJurCGE/uPLJiswrok3y/eD+qFbRmuWSLV6EcO6AiMC9wX90Ado+eqcw4njhrcCtgmBYu2iM5Cvo0tfdovlcVHld5bZQDSyXK69kxTNA/ENwq1Ijee5ywf6vPOvwThPcyUErhuzW27tNZ4rzux57eI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es813jxw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es813jxw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso12500645e9.2
        for <linux-man@vger.kernel.org>; Sat, 26 Sep 2026 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790431331; x=1791036131; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIgD58c3Si7igjuyW1uGFYpmTtqXOGmMHw21w+6OK04=;
        b=es813jxwiti92lXjEdIKsEjC/WuZacZDZuMC08ez6KjUcUuzFPNUB3RsPbjVvnXqgs
         ysl7Mgu59/VKeH9FsQuqipdNl4QZYwkaMUC8cKzIYptaIkcUJD/Q9oMuRkezhXJNZGkh
         O5+31g9tNABw5HtL0FMkY97Y9JLOdDa75KccaCPoz/Nm3Epqg5U7Zulu2PeTer843os/
         2XceQDWwi+yNL7eB3yNE9KiLyxSAkJLeRhXfw1K1QWbTKTFzt7+ZNxxY9KFzTkae7G79
         rumAlEKVQt6WrqSRn8sIWd7RmYmlazZ+OUzuYTIzjYR26nt3sJOjceKPgdOOrTviqfTS
         EaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790431331; x=1791036131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iIgD58c3Si7igjuyW1uGFYpmTtqXOGmMHw21w+6OK04=;
        b=0y7WD/7Orsn03d2NnSYSL+P9lgxxNdSYgZGw8GZKn0PT+HpjOeqDYDdSmdqMByrs0W
         87xxpnFTJiyzOTiEo4g9GaW5TxcCzzo5N4Lpdv17SqJMXQK1zo8bS1pzwZ7VUlZLZEcw
         YJt7HvkIQG87/PmyEnZsydkP0NCsubpl0BThsbhYt5/gMJcIdp1qOYVUfT/ZfzEkYti1
         Aifhq58l4zXnw/Sy19HDmBrLS39NUXh3ZPChAA0Q562RxqJmANbS9mNdKZJea+4WWd3/
         6hW6s29DSYq4ZTIDw8B+TyVQIS3lc5vEMkDfz3Mgt/anU6kajWs8dMR7FdCxwx/SYlfJ
         wZ2g==
X-Forwarded-Encrypted: i=1; AKwUvBwtLP2rGx9sJfsess31hUwV8AgOfx64Jty00tcyOujZFHFoKn6yf7W7MhIgVqo2B+xHukwnERUTsqg=@vger.kernel.org
X-Gm-Message-State: AFuF++mu82R++RQYecNhSJDs/Eu41776MggGaujHyHjaEC+JldkBrwa7
	gBetNKb3PxWcxTH1tVPxXk5YEkpuAE9irGYmk5/y8pxriI3GX0OfOpM8jEqOyK0a
X-Gm-Gg: AYBFou1JQAmfAi7EeVs5bbnG5DUXLzQmQ/IQwg4CD+Je7oa8r5TRVv3mPfhqSfnya7D
	d74LTekFL7juqWZNNfPkGrTlMLgZBrOeP50Wi9ATLBql1j860XAuUehh6EL3uMuzlhD4XqkT0Rv
	/SrCoruHOFFBFsD6HA+6HqY7FRaTNRPlAf11ze0YgoUqL8s+1CfTtdUQHIIU7Lmmqtn3iFrwmI/
	TBZqYxjv8r06dGbLBJgn9KRv2pMyjoFkCAaRN9sGfwgN3z7Z3VdNQo/MWsOXcWgCxlIC1IphVc3
	Hg7gW/Gyh6x5SFWU1GdBZOkpU7r5465ZexI+zt8Pt6kSnJUKBYIIHil0foBVxrjHGR828ct8f6Y
	vv2XjTaM0AkLtGJLwWIEQNJF7Zunz7oRALeR1gR9uYtgQjY/jub9dJ2QKsjmU8vJN0QbFiewH0h
	VOwgFg9TrbSFAHeWUgAyOn+/178ZQu8ivUi612+0h8D9xXeqa9jj1sBPGtIFKRUxuoE7Kq1EE2O
	c0tVnqDGy0z1Nf8Z/x6z50=
X-Received: by 2002:a05:600c:c173:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49fe66eb262mr156141155e9.20.1790431330864;
        Sat, 26 Sep 2026 07:02:10 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fffa334e6sm24917985e9.10.2026.09.26.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:02:10 -0700 (PDT)
Date: Sat, 26 Sep 2026 16:01:55 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: Alejandro Colomar <alx@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH 3/3] man/man7/landlock.7, man/man2/landlock_add_rule.2:
 Document UDP support
Message-ID: <20260926.1c3fe1d53003@gnoack.org>
References: <20260917075853.10231-1-matthieu@buffet.re>
 <20260917075853.10231-4-matthieu@buffet.re>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917075853.10231-4-matthieu@buffet.re>

Nit: On subject line: You can use "man/man?/landlock*.?", similar to
Tingmao's commit bd51589f (2026-09-11; "man/man?/landlock*.?: Document
LANDLOCK_ADD_RULE_QUIET")

High level remark: This patch does not apply cleanly, can you please
rebase?  I think it might be conflicting with Tingmao's recent "quiet
flag" changes.

On Thu, Sep 17, 2026 at 09:58:52AM +0200, Matthieu Buffet wrote:
> Landlock support for UDP-specific policy was merged in 7.2 in
> linux.git 9a8ed15ce224 ("landlock: Add UDP bind() access control")
> and
> linux.git e61247a2e694 ("landlock: Add UDP send+connect access control")
> 
> Update the example to account for ABI v10, and add documentation for new
> access rights taken from the UAPI header, plus:
> - explicitly state in the access right description that sending
>   datagrams without a destination does not require any access right
> - more importantly: clarify the description of the most non-trivial
>   behaviour (auto-bind denials when emitting, which can occur even if
>   CONNECT_SEND_UDP is not handled)
> 
> Link: <https://github.com/landlock-lsm/linux/issues/66>
> Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
> ---
>  man/man2/landlock_add_rule.2 | 15 +++++---
>  man/man7/landlock.7          | 70 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 78 insertions(+), 7 deletions(-)
> 
> diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> index 633d89824373..2b2b28147de0 100644
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
> @@ -120,8 +120,14 @@ with
>  A Landlock rule with port 0
>  and the
>  .B LANDLOCK_ACCESS_NET_BIND_TCP
> -right means that requesting to bind on port 0 is allowed
> -and it will automatically translate to binding on the related port range.
> +or
> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> +right means that requesting to bind on port 0
> +(explicitly, or implicitly
> +by e.g.\& sending a datagram on an unbound UDP socket)
      ^^^^^^

Per man-pages(7) style guide, "e.g." is followed by a comma and should
be avoided except in short parenthetical asides (e.g., like this one).


> +is allowed
> +and it will automatically translate to
> +binding on a kernel-assigned ephemeral port.
>  .P
>  .I flags
>  must be 0.
> @@ -141,7 +147,8 @@ can fail for the following reasons:
>  .I rule_type
>  is
>  .BR LANDLOCK_RULE_NET_PORT ,
> -but TCP is not supported by the running kernel.
> +but the kernel was built without
> +.BR CONFIG_INET .

Good catch, this should be adapted in the kernel documentation as
well.

>  .TP
>  .B EBADF
>  .I ruleset_fd
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index 51e63f40052c..884e1d49feb0 100644
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
> @@ -277,6 +277,55 @@ Bind a TCP socket to a local port.
>  .BR LANDLOCK_ACCESS_NET_CONNECT_TCP "  (since Landlock ABI version 4)"
>  Connect an active TCP socket to a remote port.
>  .P
> +And similarly for UDP port numbers:
> +.TP
> +.BR LANDLOCK_ACCESS_NET_BIND_UDP "  (since Landlock ABI version 10)"
> +Bind a UDP socket to the given local port.
> +.TP
> +.BR LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP "  (since Landlock ABI version 10)"
> +Set the remote port of a UDP socket to the given port,
> +or send datagrams to the given remote port
> +taking precedence over any destination pre-set on a socket.
> +Sending without an explicit destination
> +(i.e.\& on a socket already connected)

Same for "i.e." as for "e.g.".

> +is never restricted.
> +.P
> +Note on auto-binding:
> +Setting a remote address
> +or sending a first datagram
> +on UDP sockets
> +performs an implicit
> +.BR bind (2)
> +to an ephemeral local source port
> +if not already bound.
> +If
> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> +is handled,
> +to avoid an
> +.B EACCES
> +error when sending outbound datagrams
> +(even if
> +.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
> +is not handled),
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
>  Note on
>  .BR AF_UNSPEC :
>  Calling
> @@ -292,6 +341,17 @@ for IPv4 and
>  .B INADDR_ANY
>  it is treated as
>  .BR AF_INET .
> +Sending datagrams to that address family
> +on IPv4 UDP sockets
> +will similarly be treated as
> +.BR AF_INET .
> +On IPv6 UDP sockets,
> +such use is not supported
> +and will always result in a denial as if the policy rejected it:
> +use a
> +.I NULL
> +address instead to get the same semantics
> +inside and outside a Landlock domain.
>  All other uses of that address family result in the same error codes
>  as when Landlock is not in use.
>  .\"
> @@ -518,6 +578,9 @@ _	_	_
>  8	7.0	LANDLOCK_RESTRICT_SELF_TSYNC
>  _	_	_
>  9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
> +_	_	_
> +10	7.2	LANDLOCK_ACCESS_NET_BIND_UDP
> +\^	\^	LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
>  .TE
>  .P
>  Users should use the Landlock ABI version rather than the kernel version
> @@ -628,6 +691,7 @@ __u64 landlock_fs_access_rights[] = {
>      (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v7: same
>      (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v8: same
>      (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v9: add "resolve_unix"
> +    (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v10: UDP support
>  };
>  \&
>  int abi = landlock_create_ruleset(NULL, 0,
> @@ -640,7 +704,7 @@ if (abi == \-1) {
>      perror("Unable to use Landlock");
>      return;  /* Graceful fallback: Do nothing.  */
>  }
> -abi = MIN(abi, 9);
> +abi = MIN(abi, 10);
>  \&
>  /* Only use the available rights in the ruleset.  */
>  attr.handled_access_fs &= landlock_fs_access_rights[abi \- 1];
> -- 
> 2.47.3
> 

Documentation seems correct.

I notcied that the original kernel documentation was rephrased in
multiple places.  I think these rephrases are largely good and help to
explain the subject, but I'm a bit worried that the two documentation
places might drift apart.  Are you planning on sending a follow-up on
the kernel side to keep both sides in sync?

In some cases, we might need to balance conciseness and detail (e.g.,
you might want to see how this looks rendered (man -l) to see that the
descriptions of the UDP rights are not significantly longer than the
ones for TCP.)

Reviewed-by: Günther Noack <gnoack3000@gmail.com>

Thanks,
-Günther
