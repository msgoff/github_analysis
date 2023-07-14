/*
 * @LANG: c
 */
#include <string.h>
#include <ctype.h>
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

int scan(const char *in);
%%{
	machine part_token;
	main := |*

'"action":' => { printf("%s,%zd,%zd", ":action",(ts-in),(te-in));};
'"actions":' => { printf("%s,%zd,%zd", ":actions",(ts-in),(te-in));};
'"actions_variables":' => { printf("%s,%zd,%zd", ":actions_variables",(ts-in),(te-in));};
'"actor":' => { printf("%s,%zd,%zd", ":actor",(ts-in),(te-in));};
'"administration":' => { printf("%s,%zd,%zd", ":administration",(ts-in),(te-in));};
'"archived":' => { printf("%s,%zd,%zd", ":archived",(ts-in),(te-in));};
'"archive_url":' => { printf("%s,%zd,%zd", ":archive_url",(ts-in),(te-in));};
'"assets_url":' => { printf("%s,%zd,%zd", ":assets_url",(ts-in),(te-in));};
'"assignees_url":' => { printf("%s,%zd,%zd", ":assignees_url",(ts-in),(te-in));};
'"author_association":' => { printf("%s,%zd,%zd", ":author_association",(ts-in),(te-in));};
'"author":' => { printf("%s,%zd,%zd", ":author",(ts-in),(te-in));};
'"avatar_url":' => { printf("%s,%zd,%zd", ":avatar_url",(ts-in),(te-in));};
'"before":' => { printf("%s,%zd,%zd", ":before",(ts-in),(te-in));};
'"blobs_url":' => { printf("%s,%zd,%zd", ":blobs_url",(ts-in),(te-in));};
'"blocking":' => { printf("%s,%zd,%zd", ":blocking",(ts-in),(te-in));};
'"body":' => { printf("%s,%zd,%zd", ":body",(ts-in),(te-in));};
'"branches_url":' => { printf("%s,%zd,%zd", ":branches_url",(ts-in),(te-in));};
'"browser_download_url":' => { printf("%s,%zd,%zd", ":browser_download_url",(ts-in),(te-in));};
'"checks":' => { printf("%s,%zd,%zd", ":checks",(ts-in),(te-in));};
'"clone_url":' => { printf("%s,%zd,%zd", ":clone_url",(ts-in),(te-in));};
'"closed_at":' => { printf("%s,%zd,%zd", ":closed_at",(ts-in),(te-in));};
'"codespaces_lifecycle_admin":' => { printf("%s,%zd,%zd", ":codespaces_lifecycle_admin",(ts-in),(te-in));};
'"codespaces_metadata":' => { printf("%s,%zd,%zd", ":codespaces_metadata",(ts-in),(te-in));};
'"codespaces":' => { printf("%s,%zd,%zd", ":codespaces",(ts-in),(te-in));};
'"codespaces_secrets":' => { printf("%s,%zd,%zd", ":codespaces_secrets",(ts-in),(te-in));};
'"codespaces_user_secrets":' => { printf("%s,%zd,%zd", ":codespaces_user_secrets",(ts-in),(te-in));};
'"collaborators_url":' => { printf("%s,%zd,%zd", ":collaborators_url",(ts-in),(te-in));};
'"color":' => { printf("%s,%zd,%zd", ":color",(ts-in),(te-in));};
'"comments_url":' => { printf("%s,%zd,%zd", ":comments_url",(ts-in),(te-in));};
'"commit_id":' => { printf("%s,%zd,%zd", ":commit_id",(ts-in),(te-in));};
'"commit_message":' => { printf("%s,%zd,%zd", ":commit_message",(ts-in),(te-in));};
'"commits":' => { printf("%s,%zd,%zd", ":commits",(ts-in),(te-in));};
'"commits_url":' => { printf("%s,%zd,%zd", ":commits_url",(ts-in),(te-in));};
'"commit_title":' => { printf("%s,%zd,%zd", ":commit_title",(ts-in),(te-in));};
'"compare_url":' => { printf("%s,%zd,%zd", ":compare_url",(ts-in),(te-in));};
'"contents":' => { printf("%s,%zd,%zd", ":contents",(ts-in),(te-in));};
'"contents_url":' => { printf("%s,%zd,%zd", ":contents_url",(ts-in),(te-in));};
'"content_type":' => { printf("%s,%zd,%zd", ":content_type",(ts-in),(te-in));};
'"contributors_url":' => { printf("%s,%zd,%zd", ":contributors_url",(ts-in),(te-in));};
'"created_at":' => { printf("%s,%zd,%zd", ":created_at",(ts-in),(te-in));};
'"default_branch":' => { printf("%s,%zd,%zd", ":default_branch",(ts-in),(te-in));};
'"dependabot_secrets":' => { printf("%s,%zd,%zd", ":dependabot_secrets",(ts-in),(te-in));};
'"deployments":' => { printf("%s,%zd,%zd", ":deployments",(ts-in),(te-in));};
'"deployments_url":' => { printf("%s,%zd,%zd", ":deployments_url",(ts-in),(te-in));};
'"description":' => { printf("%s,%zd,%zd", ":description",(ts-in),(te-in));};
'"diff_hunk":' => { printf("%s,%zd,%zd", ":diff_hunk",(ts-in),(te-in));};
'"diff_url":' => { printf("%s,%zd,%zd", ":diff_url",(ts-in),(te-in));};
'"disabled":' => { printf("%s,%zd,%zd", ":disabled",(ts-in),(te-in));};
'"discussions":' => { printf("%s,%zd,%zd", ":discussions",(ts-in),(te-in));};
'"discussion_url":' => { printf("%s,%zd,%zd", ":discussion_url",(ts-in),(te-in));};
'"display_login":' => { printf("%s,%zd,%zd", ":display_login",(ts-in),(te-in));};
'"distinct":' => { printf("%s,%zd,%zd", ":distinct",(ts-in),(te-in));};
'"distinct_size":' => { printf("%s,%zd,%zd", ":distinct_size",(ts-in),(te-in));};
'"downloads_url":' => { printf("%s,%zd,%zd", ":downloads_url",(ts-in),(te-in));};
'"due_on":' => { printf("%s,%zd,%zd", ":due_on",(ts-in),(te-in));};
'"email":' => { printf("%s,%zd,%zd", ":email",(ts-in),(te-in));};
'"emails":' => { printf("%s,%zd,%zd", ":emails",(ts-in),(te-in));};
'"environments":' => { printf("%s,%zd,%zd", ":environments",(ts-in),(te-in));};
'"events_url":' => { printf("%s,%zd,%zd", ":events_url",(ts-in),(te-in));};
'"external_url":' => { printf("%s,%zd,%zd", ":external_url",(ts-in),(te-in));};
'"followers":' => { printf("%s,%zd,%zd", ":followers",(ts-in),(te-in));};
'"followers_url":' => { printf("%s,%zd,%zd", ":followers_url",(ts-in),(te-in));};
'"following_url":' => { printf("%s,%zd,%zd", ":following_url",(ts-in),(te-in));};
'"forkee":' => { printf("%s,%zd,%zd", ":forkee",(ts-in),(te-in));};
'"forks_count":' => { printf("%s,%zd,%zd", ":forks_count",(ts-in),(te-in));};
'"forks":' => { printf("%s,%zd,%zd", ":forks",(ts-in),(te-in));};
'"forks_url":' => { printf("%s,%zd,%zd", ":forks_url",(ts-in),(te-in));};
'"full_name":' => { printf("%s,%zd,%zd", ":full_name",(ts-in),(te-in));};
'"gists":' => { printf("%s,%zd,%zd", ":gists",(ts-in),(te-in));};
'"gists_url":' => { printf("%s,%zd,%zd", ":gists_url",(ts-in),(te-in));};
'"git_commits_url":' => { printf("%s,%zd,%zd", ":git_commits_url",(ts-in),(te-in));};
'"git_refs_url":' => { printf("%s,%zd,%zd", ":git_refs_url",(ts-in),(te-in));};
'"git_signing_ssh_public_keys":' => { printf("%s,%zd,%zd", ":git_signing_ssh_public_keys",(ts-in),(te-in));};
'"git_tags_url":' => { printf("%s,%zd,%zd", ":git_tags_url",(ts-in),(te-in));};
'"git_url":' => { printf("%s,%zd,%zd", ":git_url",(ts-in),(te-in));};
'"gpg_keys":' => { printf("%s,%zd,%zd", ":gpg_keys",(ts-in),(te-in));};
'"gravatar_id":' => { printf("%s,%zd,%zd", ":gravatar_id",(ts-in),(te-in));};
'"has_discussions":' => { printf("%s,%zd,%zd", ":has_discussions",(ts-in),(te-in));};
'"has_downloads":' => { printf("%s,%zd,%zd", ":has_downloads",(ts-in),(te-in));};
'"has_issues":' => { printf("%s,%zd,%zd", ":has_issues",(ts-in),(te-in));};
'"has_pages":' => { printf("%s,%zd,%zd", ":has_pages",(ts-in),(te-in));};
'"has_projects":' => { printf("%s,%zd,%zd", ":has_projects",(ts-in),(te-in));};
'"has_wiki":' => { printf("%s,%zd,%zd", ":has_wiki",(ts-in),(te-in));};
'"head":' => { printf("%s,%zd,%zd", ":head",(ts-in),(te-in));};
'"homepage":' => { printf("%s,%zd,%zd", ":homepage",(ts-in),(te-in));};
'"hooks_url":' => { printf("%s,%zd,%zd", ":hooks_url",(ts-in),(te-in));};
'"href":' => { printf("%s,%zd,%zd", ":href",(ts-in),(te-in));};
'"html_url":' => { printf("%s,%zd,%zd", ":html_url",(ts-in),(te-in));};
'"id":' => { printf("%s,%zd,%zd", ":id",(ts-in),(te-in));};
'"interaction_limits":' => { printf("%s,%zd,%zd", ":interaction_limits",(ts-in),(te-in));};
'"issue_comment_url":' => { printf("%s,%zd,%zd", ":issue_comment_url",(ts-in),(te-in));};
'"issue_events_url":' => { printf("%s,%zd,%zd", ":issue_events_url",(ts-in),(te-in));};
'"issues":' => { printf("%s,%zd,%zd", ":issues",(ts-in),(te-in));};
'"issues_url":' => { printf("%s,%zd,%zd", ":issues_url",(ts-in),(te-in));};
'"issue_url":' => { printf("%s,%zd,%zd", ":issue_url",(ts-in),(te-in));};
'"key":' => { printf("%s,%zd,%zd", ":key",(ts-in),(te-in));};
'"keys":' => { printf("%s,%zd,%zd", ":keys",(ts-in),(te-in));};
'"keys_url":' => { printf("%s,%zd,%zd", ":keys_url",(ts-in),(te-in));};
'"label":' => { printf("%s,%zd,%zd", ":label",(ts-in),(te-in));};
'"labels_url":' => { printf("%s,%zd,%zd", ":labels_url",(ts-in),(te-in));};
'"language":' => { printf("%s,%zd,%zd", ":language",(ts-in),(te-in));};
'"languages_url":' => { printf("%s,%zd,%zd", ":languages_url",(ts-in),(te-in));};
'"license":' => { printf("%s,%zd,%zd", ":license",(ts-in),(te-in));};
'"login":' => { printf("%s,%zd,%zd", ":login",(ts-in),(te-in));};
'"master_branch":' => { printf("%s,%zd,%zd", ":master_branch",(ts-in),(te-in));};
'"members":' => { printf("%s,%zd,%zd", ":members",(ts-in),(te-in));};
'"members_url":' => { printf("%s,%zd,%zd", ":members_url",(ts-in),(te-in));};
'"mergeable_state":' => { printf("%s,%zd,%zd", ":mergeable_state",(ts-in),(te-in));};
'"merge_commit_sha":' => { printf("%s,%zd,%zd", ":merge_commit_sha",(ts-in),(te-in));};
'"merged_at":' => { printf("%s,%zd,%zd", ":merged_at",(ts-in),(te-in));};
'"merge_method":' => { printf("%s,%zd,%zd", ":merge_method",(ts-in),(te-in));};
'"merge_queues":' => { printf("%s,%zd,%zd", ":merge_queues",(ts-in),(te-in));};
'"merges_url":' => { printf("%s,%zd,%zd", ":merges_url",(ts-in),(te-in));};
'"message":' => { printf("%s,%zd,%zd", ":message",(ts-in),(te-in));};
'"metadata":' => { printf("%s,%zd,%zd", ":metadata",(ts-in),(te-in));};
'"milestones_url":' => { printf("%s,%zd,%zd", ":milestones_url",(ts-in),(te-in));};
'"mirror_url":' => { printf("%s,%zd,%zd", ":mirror_url",(ts-in),(te-in));};
'"name":' => { printf("%s,%zd,%zd", ":name",(ts-in),(te-in));};
'"node_id":' => { printf("%s,%zd,%zd", ":node_id",(ts-in),(te-in));};
'"notifications_url":' => { printf("%s,%zd,%zd", ":notifications_url",(ts-in),(te-in));};
'"open_issues_count":' => { printf("%s,%zd,%zd", ":open_issues_count",(ts-in),(te-in));};
'"open_issues":' => { printf("%s,%zd,%zd", ":open_issues",(ts-in),(te-in));};
'"organizations_url":' => { printf("%s,%zd,%zd", ":organizations_url",(ts-in),(te-in));};
'"org":' => { printf("%s,%zd,%zd", ":org",(ts-in),(te-in));};
'"original_commit_id":' => { printf("%s,%zd,%zd", ":original_commit_id",(ts-in),(te-in));};
'"owner":' => { printf("%s,%zd,%zd", ":owner",(ts-in),(te-in));};
'"packages":' => { printf("%s,%zd,%zd", ":packages",(ts-in),(te-in));};
'"page_name":' => { printf("%s,%zd,%zd", ":page_name",(ts-in),(te-in));};
'"pages":' => { printf("%s,%zd,%zd", ":pages",(ts-in),(te-in));};
'"patch_url":' => { printf("%s,%zd,%zd", ":patch_url",(ts-in),(te-in));};
'"path":' => { printf("%s,%zd,%zd", ":path",(ts-in),(te-in));};
'"payload":' => { printf("%s,%zd,%zd", ":payload",(ts-in),(te-in));};
'"permission":' => { printf("%s,%zd,%zd", ":permission",(ts-in),(te-in));};
'"plan":' => { printf("%s,%zd,%zd", ":plan",(ts-in),(te-in));};
'"privacy":' => { printf("%s,%zd,%zd", ":privacy",(ts-in),(te-in));};
'"private":' => { printf("%s,%zd,%zd", ":private",(ts-in),(te-in));};
'"profile_name":' => { printf("%s,%zd,%zd", ":profile_name",(ts-in),(te-in));};
'"profile":' => { printf("%s,%zd,%zd", ":profile",(ts-in),(te-in));};
'"profile_url":' => { printf("%s,%zd,%zd", ":profile_url",(ts-in),(te-in));};
'"public":' => { printf("%s,%zd,%zd", ":public",(ts-in),(te-in));};
'"published_at":' => { printf("%s,%zd,%zd", ":published_at",(ts-in),(te-in));};
'"pull_requests":' => { printf("%s,%zd,%zd", ":pull_requests",(ts-in),(te-in));};
'"pull_request_url":' => { printf("%s,%zd,%zd", ":pull_request_url",(ts-in),(te-in));};
'"pulls_url":' => { printf("%s,%zd,%zd", ":pulls_url",(ts-in),(te-in));};
'"pushed_at":' => { printf("%s,%zd,%zd", ":pushed_at",(ts-in),(te-in));};
'"pusher_type":' => { printf("%s,%zd,%zd", ":pusher_type",(ts-in),(te-in));};
'"push_id":' => { printf("%s,%zd,%zd", ":push_id",(ts-in),(te-in));};
'"received_events_url":' => { printf("%s,%zd,%zd", ":received_events_url",(ts-in),(te-in));};
'"ref":' => { printf("%s,%zd,%zd", ":ref",(ts-in),(te-in));};
'"ref_type":' => { printf("%s,%zd,%zd", ":ref_type",(ts-in),(te-in));};
'"releases_url":' => { printf("%s,%zd,%zd", ":releases_url",(ts-in),(te-in));};
'"repo":' => { printf("%s,%zd,%zd", ":repo",(ts-in),(te-in));};
'"repositories_url":' => { printf("%s,%zd,%zd", ":repositories_url",(ts-in),(te-in));};
'"repository_announcement_banners":' => { printf("%s,%zd,%zd", ":repository_announcement_banners",(ts-in),(te-in));};
'"repository_hooks":' => { printf("%s,%zd,%zd", ":repository_hooks",(ts-in),(te-in));};
'"repository_id":' => { printf("%s,%zd,%zd", ":repository_id",(ts-in),(te-in));};
'"repository_projects":' => { printf("%s,%zd,%zd", ":repository_projects",(ts-in),(te-in));};
'"repository_url":' => { printf("%s,%zd,%zd", ":repository_url",(ts-in),(te-in));};
'"repos_url":' => { printf("%s,%zd,%zd", ":repos_url",(ts-in),(te-in));};
'"review_comments_url":' => { printf("%s,%zd,%zd", ":review_comments_url",(ts-in),(te-in));};
'"review_comment_url":' => { printf("%s,%zd,%zd", ":review_comment_url",(ts-in),(te-in));};
'"secret_scanning_alerts":' => { printf("%s,%zd,%zd", ":secret_scanning_alerts",(ts-in),(te-in));};
'"secrets":' => { printf("%s,%zd,%zd", ":secrets",(ts-in),(te-in));};
'"security_events":' => { printf("%s,%zd,%zd", ":security_events",(ts-in),(te-in));};
'"sha":' => { printf("%s,%zd,%zd", ":sha",(ts-in),(te-in));};
'"short_description_html":' => { printf("%s,%zd,%zd", ":short_description_html",(ts-in),(te-in));};
'"side":' => { printf("%s,%zd,%zd", ":side",(ts-in),(te-in));};
'"site_admin":' => { printf("%s,%zd,%zd", ":site_admin",(ts-in),(te-in));};
'"size":' => { printf("%s,%zd,%zd", ":size",(ts-in),(te-in));};
'"slug":' => { printf("%s,%zd,%zd", ":slug",(ts-in),(te-in));};
'"spdx_id":' => { printf("%s,%zd,%zd", ":spdx_id",(ts-in),(te-in));};
'"ssh_url":' => { printf("%s,%zd,%zd", ":ssh_url",(ts-in),(te-in));};
'"stargazers_count":' => { printf("%s,%zd,%zd", ":stargazers_count",(ts-in),(te-in));};
'"stargazers_url":' => { printf("%s,%zd,%zd", ":stargazers_url",(ts-in),(te-in));};
'"starred_url":' => { printf("%s,%zd,%zd", ":starred_url",(ts-in),(te-in));};
'"starring":' => { printf("%s,%zd,%zd", ":starring",(ts-in),(te-in));};
'"start_side":' => { printf("%s,%zd,%zd", ":start_side",(ts-in),(te-in));};
'"state":' => { printf("%s,%zd,%zd", ":state",(ts-in),(te-in));};
'"state_reason":' => { printf("%s,%zd,%zd", ":state_reason",(ts-in),(te-in));};
'"statuses":' => { printf("%s,%zd,%zd", ":statuses",(ts-in),(te-in));};
'"statuses_url":' => { printf("%s,%zd,%zd", ":statuses_url",(ts-in),(te-in));};
'"subject_type":' => { printf("%s,%zd,%zd", ":subject_type",(ts-in),(te-in));};
'"submitted_at":' => { printf("%s,%zd,%zd", ":submitted_at",(ts-in),(te-in));};
'"subscribers_url":' => { printf("%s,%zd,%zd", ":subscribers_url",(ts-in),(te-in));};
'"subscriptions_url":' => { printf("%s,%zd,%zd", ":subscriptions_url",(ts-in),(te-in));};
'"subscription_url":' => { printf("%s,%zd,%zd", ":subscription_url",(ts-in),(te-in));};
'"svn_url":' => { printf("%s,%zd,%zd", ":svn_url",(ts-in),(te-in));};
'"tag_name":' => { printf("%s,%zd,%zd", ":tag_name",(ts-in),(te-in));};
'"tags_url":' => { printf("%s,%zd,%zd", ":tags_url",(ts-in),(te-in));};
'"tarball_url":' => { printf("%s,%zd,%zd", ":tarball_url",(ts-in),(te-in));};
'"target_commitish":' => { printf("%s,%zd,%zd", ":target_commitish",(ts-in),(te-in));};
'"teams_url":' => { printf("%s,%zd,%zd", ":teams_url",(ts-in),(te-in));};
'"timeline_url":' => { printf("%s,%zd,%zd", ":timeline_url",(ts-in),(te-in));};
'"title":' => { printf("%s,%zd,%zd", ":title",(ts-in),(te-in));};
'"trees_url":' => { printf("%s,%zd,%zd", ":trees_url",(ts-in),(te-in));};
'"type":' => { printf("%s,%zd,%zd", ":type",(ts-in),(te-in));};
'"updated_at":' => { printf("%s,%zd,%zd", ":updated_at",(ts-in),(te-in));};
'"upload_url":' => { printf("%s,%zd,%zd", ":upload_url",(ts-in),(te-in));};
'"url":' => { printf("%s,%zd,%zd", ":url",(ts-in),(te-in));};
'"visibility":' => { printf("%s,%zd,%zd", ":visibility",(ts-in),(te-in));};
'"vulnerability_alerts":' => { printf("%s,%zd,%zd", ":vulnerability_alerts",(ts-in),(te-in));};
'"watchers_count":' => { printf("%s,%zd,%zd", ":watchers_count",(ts-in),(te-in));};
'"watchers":' => { printf("%s,%zd,%zd", ":watchers",(ts-in),(te-in));};
'"watching":' => { printf("%s,%zd,%zd", ":watching",(ts-in),(te-in));};
'"workflows":' => { printf("%s,%zd,%zd", ":workflows",(ts-in),(te-in));};
'"zipball_url":' => { printf("%s,%zd,%zd", ":zipball_url",(ts-in),(te-in));};
'\n' {  printf("\n"); };
any-'\n' => {};

	*|;
}%%

%% write data;

int scan(const char *in)
{
	int cs = 0, act = 0;
	const char *p = in;
	const char *pe = in + strlen(in);
	const char *ts = NULL, *te = NULL;
	const char *eof = pe;

	%% write init;
	%% write exec;


	if (cs == part_token_error)
		printf("Error near %zd\n", p-in);
	else if(ts)
		printf("offsets: ts %zd te: %zd pe: %zd\n", ts-in, te-in, pe-in);

	return EXIT_SUCCESS;
}


int main(int argc, char **argv) {
  int cs, res = 0;
  struct stat s;
  char *buff;
  int fd;
  fd = open(argv[1], O_RDONLY);
  if (fd < 0)
    return EXIT_FAILURE;
  fstat(fd, &s);
  /* PROT_READ disallows writing to buff: will segv */
  buff = mmap(NULL, s.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
  if (buff != (void *)-1) {
    	scan((char*)buff);
	//char tmp[128];
	//memset(tmp,'\0',128);
        //strncpy(tmp,&buff[46237542],5);
	//printf("%s",tmp);
	munmap(buff, s.st_size);
  }
  close(fd);
  return 0;
}
