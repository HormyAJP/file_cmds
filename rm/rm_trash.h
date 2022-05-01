//
//  rm_trash.h
//  file_cmds
//
//  Created by Badger on 1/5/2022.
//  Copyright © 2022 Apple Inc. All rights reserved.
//

#ifndef rm_trash_h
#define rm_trash_h

int removefileToTrash(const char* f);
int rm_tree_trash(char** argv);

#endif /* rm_trash_h */
