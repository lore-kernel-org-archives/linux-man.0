Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A32E349CD8
	for <linux-man@vger.kernel.org>; Tue, 29 Sep 2026 19:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708587; cv=none; b=dbkG1FeYtyiBAbFDro2BMA+pyKPTkos1K2yAO4V9oW3imyp4Lqv/qBUfzuFGf0W7GZ08h/k0xOhsyCHL2FXiWHGGzRafrhMKsQTkelGSUtF/iy9XLxN1HPTwdSGyuVJFB2gEccj9AOAVlOw8RGJgL3wmM15qQ3nKgcPMRdx9/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708587; c=relaxed/simple;
	bh=NH3kGlC9/FtMTnjDaZv0Xuzs+9S5SDtJyKElA9OgU0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+mxzBo+skT8d6DK1lo5SoSbpLpE/xC9cabN4iosPtdDLIYntDFX8PRk+oAMrKrOO885s/Y6Lm+yy5o2pXWJYTaiYX0YvebDK+ZIdZfZ9dT+CxMYOpsA+iczEtUGGNawPtDPI4eayjlcy3IzTdpCsKL1wbcIyEc7t9gEK0Ipk3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=SOrDhDdM; arc=none smtp.client-ip=185.125.25.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="SOrDhDdM"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hvSHV43xGz8sK;
	Tue, 29 Sep 2026 21:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1790708582;
	bh=jISS4IyLFB6EvklQoV2n6D5iq93VeDCuu5KabaOCTq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOrDhDdMpewYpTzsf2vW10FfEnA4gjGK+YtstpgA6/Cuubyocfi+kf02z7ZGZPXMW
	 1Kt5TrUiCbAPPkqKODHeEF0uzAWyzRveHZ36s0GsqhAR6b19Bu8OlJYyCfe9ENW1kd
	 S7I8cFG9RD8zM5csQDShrzIIwjjVxMYlBXo2HZ24=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hvSHT5ylzz3wd;
	Tue, 29 Sep 2026 21:03:01 +0200 (CEST)
Date: Tue, 29 Sep 2026 21:03:00 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Matthieu Buffet <matthieu@buffet.re>, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH 3/3] man/man7/landlock.7, man/man2/landlock_add_rule.2:
 Document UDP support
Message-ID: <20260929.yueJeeF8chev@digikod.net>
References: <20260917075853.10231-1-matthieu@buffet.re>
 <20260917075853.10231-4-matthieu@buffet.re>
 <20260926.1c3fe1d53003@gnoack.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260926.1c3fe1d53003@gnoack.org>
X-Infomaniak-Routing: alpha

On Sat, Sep 26, 2026 at 04:01:55PM +0200, Günther Noack wrote:
> Nit: On subject line: You can use "man/man?/landlock*.?", similar to
> Tingmao's commit bd51589f (2026-09-11; "man/man?/landlock*.?: Document
> LANDLOCK_ADD_RULE_QUIET")
> 
> High level remark: This patch does not apply cleanly, can you please
> rebase?  I think it might be conflicting with Tingmao's recent "quiet
> flag" changes.
> 
> On Thu, Sep 17, 2026 at 09:58:52AM +0200, Matthieu Buffet wrote:
> > Landlock support for UDP-specific policy was merged in 7.2 in
> > linux.git 9a8ed15ce224 ("landlock: Add UDP bind() access control")
> > and
> > linux.git e61247a2e694 ("landlock: Add UDP send+connect access control")
> > 
> > Update the example to account for ABI v10, and add documentation for new
> > access rights taken from the UAPI header, plus:
> > - explicitly state in the access right description that sending
> >   datagrams without a destination does not require any access right
> > - more importantly: clarify the description of the most non-trivial
> >   behaviour (auto-bind denials when emitting, which can occur even if
> >   CONNECT_SEND_UDP is not handled)
> > 
> > Link: <https://github.com/landlock-lsm/linux/issues/66>
> > Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
> > ---
> >  man/man2/landlock_add_rule.2 | 15 +++++---
> >  man/man7/landlock.7          | 70 ++++++++++++++++++++++++++++++++++--
> >  2 files changed, 78 insertions(+), 7 deletions(-)
> > 
> > diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> > index 633d89824373..2b2b28147de0 100644
> > --- a/man/man2/landlock_add_rule.2
> > +++ b/man/man2/landlock_add_rule.2
> > @@ -82,7 +82,7 @@ just a file.
> >  .TP
> >  .BR LANDLOCK_RULE_NET_PORT "  (since Landlock ABI version 4)"
> >  For these rules,
> > -the object is a TCP port,
> > +the object is a TCP or UDP port,
> >  and the related actions are defined with
> >  .IR "network access rights" .
> >  .IP
> > @@ -120,8 +120,14 @@ with
> >  A Landlock rule with port 0
> >  and the
> >  .B LANDLOCK_ACCESS_NET_BIND_TCP
> > -right means that requesting to bind on port 0 is allowed
> > -and it will automatically translate to binding on the related port range.
> > +or
> > +.B LANDLOCK_ACCESS_NET_BIND_UDP
> > +right means that requesting to bind on port 0
> > +(explicitly, or implicitly
> > +by e.g.\& sending a datagram on an unbound UDP socket)
>       ^^^^^^
> 
> Per man-pages(7) style guide, "e.g." is followed by a comma and should
> be avoided except in short parenthetical asides (e.g., like this one).
> 
> 
> > +is allowed
> > +and it will automatically translate to
> > +binding on a kernel-assigned ephemeral port.
> >  .P
> >  .I flags
> >  must be 0.
> > @@ -141,7 +147,8 @@ can fail for the following reasons:
> >  .I rule_type
> >  is
> >  .BR LANDLOCK_RULE_NET_PORT ,
> > -but TCP is not supported by the running kernel.
> > +but the kernel was built without
> > +.BR CONFIG_INET .
> 
> Good catch, this should be adapted in the kernel documentation as
> well.
> 
> >  .TP
> >  .B EBADF
> >  .I ruleset_fd
> > diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> > index 51e63f40052c..884e1d49feb0 100644
> > --- a/man/man7/landlock.7
> > +++ b/man/man7/landlock.7
> > @@ -53,8 +53,8 @@ For these rules, the object is a file hierarchy,
> >  and the related filesystem actions are defined with
> >  .IR "filesystem access rights" .
> >  .TP
> > -.BR "Network rules" " (since ABI v4)"
> > -For these rules, the object is a TCP port,
> > +.BR "Network rules" " (since ABI v4 for TCP, v10 for UDP)"
> > +For these rules, the object is a TCP or UDP port,
> >  and the related actions are defined with
> >  .IR "network access rights" .
> >  .\"
> > @@ -277,6 +277,55 @@ Bind a TCP socket to a local port.
> >  .BR LANDLOCK_ACCESS_NET_CONNECT_TCP "  (since Landlock ABI version 4)"
> >  Connect an active TCP socket to a remote port.
> >  .P
> > +And similarly for UDP port numbers:
> > +.TP
> > +.BR LANDLOCK_ACCESS_NET_BIND_UDP "  (since Landlock ABI version 10)"
> > +Bind a UDP socket to the given local port.
> > +.TP
> > +.BR LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP "  (since Landlock ABI version 10)"
> > +Set the remote port of a UDP socket to the given port,
> > +or send datagrams to the given remote port
> > +taking precedence over any destination pre-set on a socket.
> > +Sending without an explicit destination
> > +(i.e.\& on a socket already connected)
> 
> Same for "i.e." as for "e.g.".
> 
> > +is never restricted.
> > +.P
> > +Note on auto-binding:
> > +Setting a remote address
> > +or sending a first datagram
> > +on UDP sockets
> > +performs an implicit
> > +.BR bind (2)
> > +to an ephemeral local source port
> > +if not already bound.
> > +If
> > +.B LANDLOCK_ACCESS_NET_BIND_UDP
> > +is handled,
> > +to avoid an
> > +.B EACCES
> > +error when sending outbound datagrams
> > +(even if
> > +.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
> > +is not handled),
> > +either:
> > +.IP \[bu] 3
> > +use a socket already bound to a port
> > +before the ruleset started being enforced;
> > +.IP \[bu] 3
> > +grant
> > +.B LANDLOCK_ACCESS_NET_BIND_UDP
> > +on port 0, meaning
> > +\[lq]any port in the ephemeral port range\[rq];
> > +.IP \[bu] 3
> > +grant
> > +.B LANDLOCK_ACCESS_NET_BIND_UDP
> > +on a specific port,
> > +and call
> > +.BR bind (2)
> > +on that port before trying to
> > +.BR connect (2)
> > +or send datagrams.
> > +.P
> >  Note on
> >  .BR AF_UNSPEC :
> >  Calling
> > @@ -292,6 +341,17 @@ for IPv4 and
> >  .B INADDR_ANY
> >  it is treated as
> >  .BR AF_INET .
> > +Sending datagrams to that address family
> > +on IPv4 UDP sockets
> > +will similarly be treated as
> > +.BR AF_INET .
> > +On IPv6 UDP sockets,
> > +such use is not supported
> > +and will always result in a denial as if the policy rejected it:
> > +use a
> > +.I NULL
> > +address instead to get the same semantics
> > +inside and outside a Landlock domain.
> >  All other uses of that address family result in the same error codes
> >  as when Landlock is not in use.
> >  .\"
> > @@ -518,6 +578,9 @@ _	_	_
> >  8	7.0	LANDLOCK_RESTRICT_SELF_TSYNC
> >  _	_	_
> >  9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
> > +_	_	_
> > +10	7.2	LANDLOCK_ACCESS_NET_BIND_UDP
> > +\^	\^	LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
> >  .TE
> >  .P
> >  Users should use the Landlock ABI version rather than the kernel version
> > @@ -628,6 +691,7 @@ __u64 landlock_fs_access_rights[] = {
> >      (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v7: same
> >      (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v8: same
> >      (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v9: add "resolve_unix"
> > +    (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v10: UDP support
> >  };
> >  \&
> >  int abi = landlock_create_ruleset(NULL, 0,
> > @@ -640,7 +704,7 @@ if (abi == \-1) {
> >      perror("Unable to use Landlock");
> >      return;  /* Graceful fallback: Do nothing.  */
> >  }
> > -abi = MIN(abi, 9);
> > +abi = MIN(abi, 10);
> >  \&
> >  /* Only use the available rights in the ruleset.  */
> >  attr.handled_access_fs &= landlock_fs_access_rights[abi \- 1];
> > -- 
> > 2.47.3
> > 
> 
> Documentation seems correct.
> 
> I notcied that the original kernel documentation was rephrased in
> multiple places.  I think these rephrases are largely good and help to
> explain the subject, but I'm a bit worried that the two documentation
> places might drift apart.  Are you planning on sending a follow-up on
> the kernel side to keep both sides in sync?

As Matthieu proposed in the cover letter, yes that would definitely be
appreciated.

> 
> In some cases, we might need to balance conciseness and detail (e.g.,
> you might want to see how this looks rendered (man -l) to see that the
> descriptions of the UDP rights are not significantly longer than the
> ones for TCP.)
> 
> Reviewed-by: Günther Noack <gnoack3000@gmail.com>

Reviewed-by: Mickaël Salaün <mic@digikod.net>

> 
> Thanks,
> -Günther
