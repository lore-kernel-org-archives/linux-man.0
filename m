Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3FA394EB0
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384528; cv=none; b=fYb11Xo3vYi3vgVAbX3mQ6bdaVwC6/iq/npJxguBWktOU4EDxFZWAyExJdzdX6kUQ9MwZ1MGvH5Bw94G92ZrgHzWwwQ261A96vXMmPRC2zmSyysDBsTbPT8ygV3Wa1qLvOzcyOPg00UiJTM8CtuGuE0WgktinxZ1HG51ikjySV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384528; c=relaxed/simple;
	bh=jpGFNjSBBmNUy3Gl/jp8tYt70gSz/mMA9Ufz83PUXBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEj+g8JKCIIjY80BHXUbd+oLUJxH+KHAzCZXuYLyCmqGhF8nP1N7wru94VhFWWGNeVD33sJgMSyOmVEQwrblvUs3JIm6PiShtlvV7pBYwUO0otykTPAnQz59OIeSdfz8pAz9jkATw6SY84VTqT2XdBxQ+FxVsK0+fMuCKPxrDXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=w/bGU5sG; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mjpr429T; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=A9SnipWp; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=LIPPGH5J; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="w/bGU5sG";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mjpr429T";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="A9SnipWp";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="LIPPGH5J"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 56ECA1F451;
	Mon, 14 Sep 2026 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1789384521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cnUGvYBuA3DCfZKGfT3jfsJWzYuqmA2hemHSTzNMkAk=;
	b=w/bGU5sGDtgAVH9OukXTjmXoc75aBpBdk1UWqlBl1qpClm7hU+JMfIl8SFV5KtpZSDfA26
	vCYtL1NA2o2dq3s+XgmWze6VScIp1od+n3vq0mdeMiQtV2hKqCER9bGmpfbhVzicTIkc6O
	IYVswqonVI28LhBzVqe70pbhqc7AqpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1789384521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cnUGvYBuA3DCfZKGfT3jfsJWzYuqmA2hemHSTzNMkAk=;
	b=mjpr429T/bXwcPdburOSNyZobJD82NVAgrmdnSG+N6siz6cDCg/pNlzP3DZ+izOll/2G68
	ffrPvC3NAnpKRWBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=A9SnipWp;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=LIPPGH5J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1789384517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cnUGvYBuA3DCfZKGfT3jfsJWzYuqmA2hemHSTzNMkAk=;
	b=A9SnipWpqoQ1XWEkoni7UqGvhMXnWWkgWDMWWjuwksO/1H0+xkGWWerTqQQtuw5OxI5byb
	fjykq/eK9322NxasaM2eCUPR8pgVDLwnYrAJxTHaNlwZbnZlBIcD6rvdgmQTHHTuWuK/6c
	W2xr3MVk8866RYJO8hNGFVbPDJNpowE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1789384517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cnUGvYBuA3DCfZKGfT3jfsJWzYuqmA2hemHSTzNMkAk=;
	b=LIPPGH5JulPKB1sVjPxkhCZRIUQF+QIy78gdcZw1KN9NvAtIgS7Xq/BooCeS84Li7JG2KB
	NCcficuZlMirPMBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1ECCD13693;
	Mon, 14 Sep 2026 11:15:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q93kBkXXp2oaTAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Mon, 14 Sep 2026 11:15:17 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-man@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size forward-declarations
Date: Mon, 14 Sep 2026 13:15:11 +0200
Message-ID: <20260914111511.1610878-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 56ECA1F451
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO

request_key was left from GNU forward-declarations of parameters for
sizes of array parameters.

Fixes: d2c2db883 ("man/: SYNOPSIS: Use GNU forward-declarations of parameters for sizes of array parameters")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Alejandro,

although I don't like N3207 GNU forward-declarations of parameters for
sizes of array parameters syntax (I'd prefer to have the signatures
which are in the headers) and I don't think it's practical (before one
could copy paste the signature from man page), I understand it's a
wanted feature. Therefore I fixed missing size parameter in request_key.

I suppose more functions were left in d2c2db883.

Kind regards,
Petr

 man/man2/request_key.2 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man/man2/request_key.2 b/man/man2/request_key.2
index 3bb52f31b..d16642d9f 100644
--- a/man/man2/request_key.2
+++ b/man/man2/request_key.2
@@ -14,7 +14,8 @@ Linux Key Management Utilities
 .nf
 .B #include <keyutils.h>
 .P
-.BI "key_serial_t request_key(const char *" type ", const char *" description ,
+.BR "key_serial_t request_key(" "size_t size;"
+.BI "                         (const char *" type ", const char *" description ,
 .BI "                         const char *_Nullable " callout_info ,
 .BI "                         key_serial_t " dest_keyring );
 .fi
-- 
2.55.0

