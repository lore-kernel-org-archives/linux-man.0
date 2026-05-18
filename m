Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67417355F2A
	for <linux-man@vger.kernel.org>; Mon, 18 May 2026 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116764; cv=none; b=lOJ0tu/W+3NSoM94kLYMbQ+jAtJGfXr5ucflqHB0FceN4vM7R5IBqWguzMn+4cTicpYBwitEtnWgD9s3+1XbDDDXnZQvkeiyIFNBsCSzjamE5og45K36Ew+d7Zsm0gZtQLWU3X/TOtrwF3h4wX+ckVnYJDC6GU/8SKCB6jvc/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116764; c=relaxed/simple;
	bh=n+ezyEHvrdIB16BMG6VyzJowXR1WoHY6pKz6RMGmOBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Si85nXG3lTmG1Sq6FD6mzw22pZJ77xpo1pkGszll1SPwi0SttTaly3CSWPbbX6e9mdVzxivFmCMzT9HtDfpYHD2aKHPgWVg44gy52lUYvgbIinvDxTbITF8P93aTUUTgZFSCY2/rbFqJahmY8xxgmO5wGQF8n1c/D878bMkqgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=R0tSztzn; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=MPJ7EK2o; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=R0tSztzn; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=MPJ7EK2o; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="R0tSztzn";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="MPJ7EK2o";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="R0tSztzn";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="MPJ7EK2o"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7A58A670B3;
	Mon, 18 May 2026 15:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1779116760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1a7NmVIN5DxCcG2OQXRaJoK84McH2SpbqheH3WGNgps=;
	b=R0tSztznTWMW7+u7iAw87knzq2enR4R/PrEejv6Ag/eZUg0pATpWav1zpl+aeQcDYGO5Rm
	LCcwG1Wzi3RhHUt/v9t16fkZwz4yYa6V8O/IRyWXKKdeLtv2lUG4WvRCCsDd7VmTo0OcTq
	9PtsgoVA3pGMfSHW4jJz1N9OnGakTHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1779116760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1a7NmVIN5DxCcG2OQXRaJoK84McH2SpbqheH3WGNgps=;
	b=MPJ7EK2oaX3KtoR8/CwOzTQIs2Xc1rrfTr7aSldOyOlSHXkM4eZ0iWKOlsaJ+L1kJASgbY
	BidDXxc9kG0DYPDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=R0tSztzn;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=MPJ7EK2o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1779116760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1a7NmVIN5DxCcG2OQXRaJoK84McH2SpbqheH3WGNgps=;
	b=R0tSztznTWMW7+u7iAw87knzq2enR4R/PrEejv6Ag/eZUg0pATpWav1zpl+aeQcDYGO5Rm
	LCcwG1Wzi3RhHUt/v9t16fkZwz4yYa6V8O/IRyWXKKdeLtv2lUG4WvRCCsDd7VmTo0OcTq
	9PtsgoVA3pGMfSHW4jJz1N9OnGakTHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1779116760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1a7NmVIN5DxCcG2OQXRaJoK84McH2SpbqheH3WGNgps=;
	b=MPJ7EK2oaX3KtoR8/CwOzTQIs2Xc1rrfTr7aSldOyOlSHXkM4eZ0iWKOlsaJ+L1kJASgbY
	BidDXxc9kG0DYPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71B0A593A8;
	Mon, 18 May 2026 15:06:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qNS7G9gqC2pOLwAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 18 May 2026 15:06:00 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 7A4E2A0A90; Mon, 18 May 2026 17:05:59 +0200 (CEST)
Date: Mon, 18 May 2026 17:05:59 +0200
From: Jan Kara <jack@suse.cz>
To: Alejandro Colomar <alx@kernel.org>
Cc: Jan Kara <jack@suse.cz>, linux-man@vger.kernel.org, 
	Petr Gajdos <pgajdos@suse.cz>, Jan Blunck <jblunck@novell.com>
Subject: Re: [PATCH v1] man/man2/quotactl.2: tfix
Message-ID: <b2kszapero3mb6q3763rrgjjfltkvt7aapm6s7oakpbpepfypk@mwybch7ayyqd>
References: <9d328eab7a632ac87f48bcfe88c0e5c3cca18d2a.1778951437.git.alx@kernel.org>
 <kf4k33gsaax2v2iwzfprvogsyfqxbjdldpkdefwraaea2ytijx@tm7g2gul3h53>
 <agsKOHLgfGkiyE1r@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agsKOHLgfGkiyE1r@devuan>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,suse.cz:email];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Queue-Id: 7A58A670B3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.01

Hi Alejandro!

On Mon 18-05-26 14:51:45, Alejandro Colomar wrote:
> On 2026-05-18T12:20:50+0200, Jan Kara wrote:
> > On Sat 16-05-26 19:12:08, Alejandro Colomar wrote:
> > > It seems most likely that this was a typo, and that Q_XQUOTAON was
> > > meant.
> > > 
> > > Fixes: 1eeddf25 (2010-06-16; "quotactl.2: Major updates")
> > > Cc: Jan Kara <jack@suse.cz>
> > > Cc: Petr Gajdos <pgajdos@suse.cz>
> > > Cc: Jan Blunck <jblunck@novell.com>
> > > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > 
> > Right. Thanks for the fix. Feel free to add:
> 
> I have more questions about quotactl(2).  In the operations that ignore
> the 'id' argument, am I right to assume that QCMD() is unnecessary?  My
> assumption is because if there's no user or group ID to be used, it also
> doesn't make sense to specify whether we want to affect a user or a
> group.
> 
> So, for example, Q_QUOTAOFF would have the following synopsis:
> 
> 	int quotactl(Q_QUOTAOFF, const char *_Nullable special, 0, NULL);
> 
> While Q_QUOTAON would have the following one:
> 
> 	int quotactl(QCMD(Q_QUOTAON, type), const char *_Nullable special,
> 		     int fmt, caddr_t quota_path);
> 
> Is that correct?

No, QCMD() is always required. For example for Q_QUOTAOFF you still need to
tell whether you want to disable user or group quotas. And even if the type
would not matter for some quotactl, QCMD still does a mangling to the
passed arguments that is expected by the kernel (QCMD is ((cmd) <<
SUBCMDSHIFT) | ((type) & SUBCMDMASK)).

> Also, I wonder why caddr_t was used at all, instead of void*.  It seems
> to unnecessarily require a cast, which could have been avoided with
> void*.  In quotactl_fd(), since we need to use syscall(2), which is
> variadic, I'll document the correct pointer types, instead of caddr_t*.

For this I don't have a good answer. It was like that for ages... I guess
you can ask glibc guys - the kernel uses void * but glibc uses caddr_t.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
