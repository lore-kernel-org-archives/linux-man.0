Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219808;
	b=DnQIk5t2j3wSRMLPepp9FlsBVT/vdYsPyI5ILKeYjl9ngHeeAUgKHVyEXvx9K1rlCJ4f
	 DvardUBpjcFpr9Ub8ApyqKGK1nRq4dTlNmNWbSlSk5Py5p98ZPGIG5bDtX8Z6kkDyXsl0
	 mwOq4Avz35XWp824dPJ+l9Zo4AcT7FafrpzABAhpiNs/oXCEgeuvMQqnMDuzKzapubiEG
	 zA/BmBOKgROzZz6DcdVeFXXLVzvMztsfS+hxdgRKWebwqxZJ/BoYKqdJj6dZ18/yjZW/m
	 uo3+tvG3R1qRLbjYzEguh+b/M9M4wq9Z5EZ0wyAEaUZv/tvKXvkUOBnSJElilakH68w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219808;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=3UmoHXRtkaDxkoiKaYGZ3kgAns8zPppqpe19T7Z5lNM=;
	b=mMbAOZiTIWvI/oIn+m9HUEbsOiu+qEQaYnTVbhulL8G4/8aXcYLBdUN8XbjK3v4XTNoM
	 P6+NQiGHcdt54aBi1IKNf2/+KQEvuUTO7JSX+IqvpSvpLFGWXx677WPOVkixD6J9u05RE
	 zRMXmlh2+a+sIMl9eufXX3yb2juFIGCkb8P0L7isv9IbGGLggBjjjv45TiuGvBBjeUXSs
	 Iu1oiCAqKXUzASvnDCUGlTolGdJW+kDu4jqa2beRWVgX65n0Naj3HsR6GEHxawFbcThH3
	 wXLSsExUDBy9Dz15pBYfXpt3WPZ3vAmqZ4knI14gCiRnqDSlwPNQf5VGYN9EDXZQH7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GjPwfC11;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BNA4Y8DM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GjPwfC11;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BNA4Y8DM;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9C5606A31C
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 10:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD9C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GjPwfC11;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BNA4Y8DM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GjPwfC11;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BNA4Y8DM
Received: from hawking.suse.de (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 096B122109;
	Mon,  9 Nov 2026 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794219806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3UmoHXRtkaDxkoiKaYGZ3kgAns8zPppqpe19T7Z5lNM=;
	b=GjPwfC11c3VD/wiDzMOY8CWAlKx6uVIspyoemZcSoWpMWcc4F6cCqRNcpWoRS8IVkwUTeM
	xIlZ6dLfLazTwgRhoG2A6opOFi2eVbkhpgH8qZyo2jOnpa9VtLQAz2n/i2qDJk2Lk9aCG9
	8eZpjATIBcKC5iON1MUI3aEjr7WpThg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794219806;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3UmoHXRtkaDxkoiKaYGZ3kgAns8zPppqpe19T7Z5lNM=;
	b=BNA4Y8DMSuFMX27KEC48+Qzrvkqb22C1jBmPpXrj+lSfEbsNNjmisXgjtb4W0H+kgY2c93
	FMjHuYUj9jBpP3Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794219806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3UmoHXRtkaDxkoiKaYGZ3kgAns8zPppqpe19T7Z5lNM=;
	b=GjPwfC11c3VD/wiDzMOY8CWAlKx6uVIspyoemZcSoWpMWcc4F6cCqRNcpWoRS8IVkwUTeM
	xIlZ6dLfLazTwgRhoG2A6opOFi2eVbkhpgH8qZyo2jOnpa9VtLQAz2n/i2qDJk2Lk9aCG9
	8eZpjATIBcKC5iON1MUI3aEjr7WpThg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794219806;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3UmoHXRtkaDxkoiKaYGZ3kgAns8zPppqpe19T7Z5lNM=;
	b=BNA4Y8DMSuFMX27KEC48+Qzrvkqb22C1jBmPpXrj+lSfEbsNNjmisXgjtb4W0H+kgY2c93
	FMjHuYUj9jBpP3Dg==
Received: by hawking.suse.de (Postfix, from userid 17005)
	id EDC134A054B; Mon,  9 Nov 2026 11:23:25 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Walter Harms <wharms@bfs.de>,  "linux-man@vger.kernel.org"
 <linux-man@vger.kernel.org>,  Rich Felker <dalias@libc.org>,
  libc-alpha@sourceware.org,  musl@lists.openwall.com,
  ~hallyn/shadow@lists.sr.ht
Subject: Re: RFC: how to document musl-crypt failure ?
In-Reply-To: <avGP3ZsVvX1mOirn@debian>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
	<avGP3ZsVvX1mOirn@debian>
Date: Mon, 09 Nov 2026 11:23:25 +0100
Message-ID: <mvmqzgugv6q.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-10.70 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.985];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-man];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Score: -10.70
X-Spam-Level: 
X-Spam-Flag: NO

On Nov 09 2026, Alejandro Colomar wrote:

> I've CCed Rich and also musl and glibc, since they probably want to
> comment.  I've also CCd shadow-utils.

libcrypt is no longer part of glibc, it is now provided by libxcrypt.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
