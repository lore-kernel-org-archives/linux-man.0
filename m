Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216BD29B766
	for <linux-man@vger.kernel.org>; Mon, 18 May 2026 10:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099655; cv=none; b=smz82yYLOf53/UlsP0bP3oBtEGwLZRAWdfGZI6oqd1IYxF6TuMFZHd5tukDAm6F1XVpEATus82Rgu15iNjY+3yoP7vPpvbxSGZE7E55Npx7KRp5HPtevs4+BFG771gMaBzkYPAJQnwaiJuuSxqJ+wd44LagqJfmBltquWRcCa+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099655; c=relaxed/simple;
	bh=/GUjQ6hNvSVS8Wm48V+9QwPYl3R09jTSlBaHXhL5Qps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDMQUCEjl3RaeacUCMYgEGyrijfJsh7UM6rZMBxv/nyoiplqamq1Fl6U07Ppf9+/HWwhCXx4R8tICFNxrVCRVd0X7Th65dceUF2Y2YO04Fnq0BMPXfMn6BlF0XWTz5sLkNTYtFN5kMiBb93WL5NnUejhlT4qNxKpaHnZptRXxAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=m0Eo+vOQ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kF2HF/Yl; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=m0Eo+vOQ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kF2HF/Yl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="m0Eo+vOQ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kF2HF/Yl";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="m0Eo+vOQ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kF2HF/Yl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 99FF666D7B;
	Mon, 18 May 2026 10:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1779099651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAjqq0HDhG1w68QZGKb1QYIBa0ednC+JV1sPpM3qvGM=;
	b=m0Eo+vOQnobcje0dLywbZa8CAmMwBjQLYZI/d+y4CWVcFfhy+bhNJjlw1U4AQZFIeQ31n8
	mlI8kRvwUfMnbNKnw2gNRVOkSHaIAs5Q6MFc+JG1pLkpoTzqEHqc+nfui/n35qg0KzFfpW
	b9cf5ZNa6jZ2jlGOSsC4ro7elRdgWkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1779099651;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAjqq0HDhG1w68QZGKb1QYIBa0ednC+JV1sPpM3qvGM=;
	b=kF2HF/YlCjbJ15o4VPsHnhbIVaLiJCmtMHFEeVHLqbsxtR1ZYWln6E2knAsIjl+Ocr/8ud
	g/aaGbQ0AC366bAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=m0Eo+vOQ;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="kF2HF/Yl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1779099651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAjqq0HDhG1w68QZGKb1QYIBa0ednC+JV1sPpM3qvGM=;
	b=m0Eo+vOQnobcje0dLywbZa8CAmMwBjQLYZI/d+y4CWVcFfhy+bhNJjlw1U4AQZFIeQ31n8
	mlI8kRvwUfMnbNKnw2gNRVOkSHaIAs5Q6MFc+JG1pLkpoTzqEHqc+nfui/n35qg0KzFfpW
	b9cf5ZNa6jZ2jlGOSsC4ro7elRdgWkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1779099651;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAjqq0HDhG1w68QZGKb1QYIBa0ednC+JV1sPpM3qvGM=;
	b=kF2HF/YlCjbJ15o4VPsHnhbIVaLiJCmtMHFEeVHLqbsxtR1ZYWln6E2knAsIjl+Ocr/8ud
	g/aaGbQ0AC366bAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92C6F593A8;
	Mon, 18 May 2026 10:20:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id haDOIwPoCmoSFwAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 18 May 2026 10:20:51 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id B5382A0A90; Mon, 18 May 2026 12:20:50 +0200 (CEST)
Date: Mon, 18 May 2026 12:20:50 +0200
From: Jan Kara <jack@suse.cz>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	Petr Gajdos <pgajdos@suse.cz>, Jan Blunck <jblunck@novell.com>
Subject: Re: [PATCH v1] man/man2/quotactl.2: tfix
Message-ID: <kf4k33gsaax2v2iwzfprvogsyfqxbjdldpkdefwraaea2ytijx@tm7g2gul3h53>
References: <9d328eab7a632ac87f48bcfe88c0e5c3cca18d2a.1778951437.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d328eab7a632ac87f48bcfe88c0e5c3cca18d2a.1778951437.git.alx@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 99FF666D7B
X-Spam-Level: 

On Sat 16-05-26 19:12:08, Alejandro Colomar wrote:
> It seems most likely that this was a typo, and that Q_XQUOTAON was
> meant.
> 
> Fixes: 1eeddf25 (2010-06-16; "quotactl.2: Major updates")
> Cc: Jan Kara <jack@suse.cz>
> Cc: Petr Gajdos <pgajdos@suse.cz>
> Cc: Jan Blunck <jblunck@novell.com>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>

Right. Thanks for the fix. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
> 
> Hi Jan,
> 
> I'm working on this page, and found what seems to be a typo.  I'd like
> you to confirm, in case I'm missing something.
> 
> 
> Have a lovely day!
> Alex
> 
>  man/man2/quotactl.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man/man2/quotactl.2 b/man/man2/quotactl.2
> index ef050714..bf361409 100644
> --- a/man/man2/quotactl.2
> +++ b/man/man2/quotactl.2
> @@ -130,7 +130,7 @@ .SH DESCRIPTION
>  .B Q_XQUOTAOFF
>  Turn off quotas for an XFS filesystem.
>  As with
> -.BR Q_QUOTAON (2const),
> +.BR Q_XQUOTAON (2const),
>  XFS filesystems expect a pointer to an
>  .I "unsigned int"
>  that specifies whether quota accounting and/or limit enforcement need
> 
> Range-diff against v0:
> -:  -------- > 1:  9d328eab man/man2/quotactl.2: tfix
> -- 
> 2.53.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
