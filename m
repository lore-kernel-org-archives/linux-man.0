From: Pradeep Kumar <pradeepsixer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: fts man page
Date: Sun, 12 Feb 2017 00:46:12 -0700
Message-ID: <0cbe4f3a-c2d6-b45d-26eb-549d46a59667@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The man page for fts library call states both the following:

     short          fts_pathlen;  /* strlen(fts_path) */

     fts_pathlen The length of the string referenced by fts_path

However, for the structures returned from fts_children() function, 
fts_pathlen is strlen(fts_path) + strlen(fts_name), which contradicts 
the man page statement. So I believe that there is either a bug in the 
man page or the fts_children() library call.

The following program can be used for verification:

#include <fts.h>
#include <pwd.h>
#include <stdio.h>
#include <string.h>

int main() {
	struct passwd *pwd_entry = getpwuid(getuid());
	char *paths[] = {pwd_entry->pw_dir, NULL};
	FTS* fts = fts_open(paths, FTS_LOGICAL, NULL);
	FTSENT* ftsent = fts_read(fts);
	FTSENT* child = fts_children(fts, 0);
	while (child != NULL) {
		printf("\n %s %s %d %lu", child->fts_path, child->fts_name,
				child->fts_pathlen, strlen(child->fts_path));
		child = child->fts_link;
	}
	return 0;
}


Thanks,
Pradeep Kumar
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
