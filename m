Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36137421224
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388696; cv=none; b=QizeMMaKSRlAhCi/QR7INeKszuju7nF//OQHxnppRrh3h/j9x79Gah1IfbVH6PTZEOwDcWd4QGzT/XisxAjhn1Dvz5LYMNYUFxNpvtlcqzADybAS8zDIQ7UGQPBY7A1ixIwlmJXe9wOKcjUPUc16MdJcuBcYvEagj9f23Tu6IjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388696; c=relaxed/simple;
	bh=DUSLVD6RLsz0IW3Alwhjf+ZIwknEXWkgSWkrE1gPPSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0xN739NNq2nQ8cGydQ3mADCy08HIOyz3QF8B045dUwN+c8sSWo+5l//mraL1quPP3nlC52YZmCpciQK5eRVZR1GIc1W2w/FRvINfq8oE87NWLWeXKncJPdTMXYSXgGd6xXsKhZkiFvPeSVL/CosxNwhdAY2AeW6LoVQ8zUQLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hGqOG+Se; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=DFjRmLoC; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=b0dsXSof; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zYX9MLMA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hGqOG+Se";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="DFjRmLoC";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="b0dsXSof";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zYX9MLMA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CE34621A48;
	Mon, 14 Sep 2026 12:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1789388689;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gsVOajNwUmgXxW4Zq8uk5+RXEsJ0Ftn3RUGuv8jhrbQ=;
	b=hGqOG+SeRm64YE7DMBeefbuRLPG5XebsLN+QA71xt+OaxgGi3JB/G18e8ICTAM54zanqRq
	IPn6+rTKxNw4WVJNOXBRwS+628+h37Ep9mSOfjjpfFNeK8FmuA3Q7HRune9I+CG28Rqseo
	ZxKebfpWUZsOwl+oPiUe3/J7FtR7gF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1789388689;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gsVOajNwUmgXxW4Zq8uk5+RXEsJ0Ftn3RUGuv8jhrbQ=;
	b=DFjRmLoCTKfPU/fIqSmvvaJj/tZW7qKN/09io6HiW6k9WK09R6YXxT9Rd6PRzWTFTrZB7d
	90MQLIbQ81CKP0AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=b0dsXSof;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=zYX9MLMA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1789388684;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gsVOajNwUmgXxW4Zq8uk5+RXEsJ0Ftn3RUGuv8jhrbQ=;
	b=b0dsXSofFZwpv8M0EtPzf1/apjPE9Sl24qkuCOK4H4PVJG3uSM565CZJlRCRAZbA+wP8Yu
	OUPlq4OgifhmaPoDtWSH2n/7IjcbF0PTTqaDxLE69+OEtrtsWgMdHDXkINCvp/sqrWfd+G
	aFdJW3/VpuAcunPDiAQ+FGkjNUmiiu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1789388684;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gsVOajNwUmgXxW4Zq8uk5+RXEsJ0Ftn3RUGuv8jhrbQ=;
	b=zYX9MLMAVAXVQ0hA3J2vv5K4EWeU1zL8Wv8PJWkCtrpZuwlnyEtD+425inF841D+6QMsnU
	KqThkXSwY1oJc7Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9605013515;
	Mon, 14 Sep 2026 12:24:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wdAMH4znp2qWGAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Mon, 14 Sep 2026 12:24:44 +0000
Date: Mon, 14 Sep 2026 14:24:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <20260914122442.GA1591402@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqfd1_Xa_TbzE1ML@devuan>
X-Spam-Score: -3.71
X-Rspamd-Queue-Id: CE34621A48
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.71 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO

Hi Alejandro,

> Hi Petr,

> > Date: 2026-09-14 13:15:11+0200
> > From: Petr Vorel <pvorel@suse.cz>

> > request_key was left from GNU forward-declarations of parameters for
> > sizes of array parameters.

> > Fixes: d2c2db883 ("man/: SYNOPSIS: Use GNU forward-declarations of parameters for sizes of array parameters")
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi Alejandro,

> > although I don't like N3207 GNU forward-declarations of parameters for
> > sizes of array parameters syntax (I'd prefer to have the signatures
> > which are in the headers) and I don't think it's practical (before one
> > could copy paste the signature from man page), I understand it's a
> > wanted feature. Therefore I fixed missing size parameter in request_key.

> > I suppose more functions were left in d2c2db883.

> > Kind regards,
> > Petr

> >  man/man2/request_key.2 | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)

> > diff --git a/man/man2/request_key.2 b/man/man2/request_key.2
> > index 3bb52f31b..d16642d9f 100644
> > --- a/man/man2/request_key.2
> > +++ b/man/man2/request_key.2
> > @@ -14,7 +14,8 @@ Linux Key Management Utilities
> >  .nf
> >  .B #include <keyutils.h>
> >  .P
> > -.BI "key_serial_t request_key(const char *" type ", const char *" description ,
> > +.BR "key_serial_t request_key(" "size_t size;"
> > +.BI "                         (const char *" type ", const char *" description ,
> >  .BI "                         const char *_Nullable " callout_info ,
> >  .BI "                         key_serial_t " dest_keyring );

> I don't see the 'size' being a parameter of this function at all.  Am
> I missing something?

Please drop this patch.  I'm sorry, I overlook that although request_key() has
const char *type like add_key(), unlike it it does not have size.

Anyway N3207 (spec mentioned in d2c2db883) is something I'll need to get used to :).

Kind regards,
Petr

> Have a lovely day!
> Alex
